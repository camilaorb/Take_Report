require 'test-evolve/core/page_object'
require 'open-uri'
require 'dbi'
require 'roo'


module Pages
  def bws_database
    @bws_database ||= BwsDatabase.new
  end

  class BwsDatabase < TestEvolve::Core::PageObject
    include Pages

    ############################ Methods ###########################


    def connect_to_bws_db(db_hostname, db_port, db_servicename, db_username, db_password)
      @connection = DBI.connect(('DBI:OCI8:' + TE.environment[db_hostname] + ':' + TE.environment[db_port].to_s + '/' + TE.environment[db_servicename]), TE.environment[db_username], TE.environment[db_password])
    end

    def verify_connection(connection: @connection)
      version = connection.select_one('select * from v$version')
      raise 'No DB connection established' unless version[0] == 'Oracle Database 12c Enterprise Edition Release 12.1.0.2.0 - 64bit Production'
    end

    def disconnect_db(connection: @connection)
      connection.disconnect
    end

    def verify_batch_status(batch_name)
      batch_status = @connection.select_one("Select PROGRAM_STATUS from RESTART_PROGRAM_STATUS Where RESTART_NAME = '#{batch_name}'")
      @batch_status = batch_status[0]
      puts 'Batch Status: ' + @batch_status
      @batch_status
    end

    def reset_batch_status(batch_name)
      unless @batch_status == 'ready for start'
        @connection.execute("Update RESTART_PROGRAM_STATUS Set PROGRAM_STATUS = 'ready for start' Where RESTART_NAME = '#{batch_name}'")
        @connection.commit
        @batch_reset = true
        puts 'Batch Status has been reset'
      end
      delete_from_restart(batch_name)
    end

    def delete_from_restart(batch_name)
      if @batch_reset
        @connection.execute("Delete from RESTART_BOOKMARK Where RESTART_NAME = '#{batch_name}'")
        @connection.commit
        puts 'Restart bookmark deleted'
      end
    end


    #############################################################################
    ########################### BWS - Verifications ###############################
    #############################################################################

    ## Below Method works for individual and multi record verification

    def verify_subdept_category(sub_dept, category)
      category.each { |cat|
        category_details = @connection.select_one("select  * from class where dept = '#{sub_dept}' and class = #{cat} ")
        raise "The Category #{cat} doesnot match with the sub depertment #{sub_dept}." if category_details.nil?
      }
    end

    def verify_sub_category(category, sub_categories)
      sub_categories.each { |sub_cat|
        category_details = @connection.select_one("select  * from Subclass where class = '#{category}' and Subclass = #{sub_cat} ")
        raise "The Sub Category #{sub_cat} doesnot match with the Category #{category}." if category_details.nil?
      }
    end

    def set_swing_tag_column expected_column_no
      @connection.execute("UPDATE OAO.OAO_PARAMETERS SET PARM_VALUE = '#{expected_column_no}' WHERE PARM_NAME = 'BWS_MAX_TICKET_PER_ITEMS'")
      @connection.commit
      oao_table = @connection.select_one("select parm_value from oao.OAO_PARAMETERS WHERE PARM_NAME = 'BWS_MAX_TICKET_PER_ITEMS'")
      actual_column = oao_table[0]
      raise "The Expected Column Value #{expected_column_no} is different from Actual column value #{actual_column} " if actual_column != expected_column_no
    end

    def reset_swing_tag_column
      @connection.execute("UPDATE OAO.OAO_PARAMETERS SET PARM_VALUE = '3' WHERE PARM_NAME = 'BWS_MAX_TICKET_PER_ITEMS'")
      @connection.commit

      actual_column = @connection.select_one("select parm_value from oao.OAO_PARAMETERS WHERE PARM_NAME = 'BWS_MAX_TICKET_PER_ITEMS'")
      raise "The Column Value is not reset to default value" if actual_column[0] != "3"
    end

    ## supplier table verification ##
    def verify_supplier_table supplier_id
      supplier_table = @connection.select_one("select * from SUPS RMS where supplier  = '#{supplier_id}'")
      raise "The #{supplier_id} supplier id does not exist in the database" if supplier_table.nil? == true
    end

    ## country table verification ##
    def verify_country_table bws_country_id
      country_table = @connection.select_one("select * from COUNTRY where COUNTRY_ID  = '#{bws_country_id}'")
      raise "The #{bws_country_id} country id does not exist in the database" if country_table.nil? == true
    end

    ## cost zone group ##
    def verify_cost_zone_group_table cost_zone_group_id
      cost_zone_table = @connection.select_one("select * from cost_zone where zone_group_id = '#{cost_zone_group_id}'")
      raise "The #{Cost_zone_group_id} Cost Zone Group does not exist in the database" if cost_zone_table.nil? == true
    end

    ## base cost and suppliers ##
    def verify_base_cost_default_to_supplier_currency(supplier, currency)
      supplier_table = @connection.select_one("select SUPPLIER, CURRENCY_CODE, SUPPLIER_PARENT from SUPS where SUPPLIER = '#{supplier}'")
      raise "The #{supplier} Supplier does not exist in the database" if supplier_table[2].nil? == true
      raise "The #{supplier} Supplier does not match with currency" if supplier_table[1].eql? currency == true
    end

    def verify_port_of_lading_table port
      ##Further implementation Remains
      # Waiting for the Data base table name / Data base table implementstion it self
    end

    def extract_vat_of_sub_dept(dept)
      vat_table = @connection.select_one("select VAT_RATE from vat_region a, vat_deps b, vat_code_rates c
where a.vat_region = b.vat_region
and b.vat_code = c.vat_code
and dept = 1209
and vat_region_name  = 'South Africa'
and ROWNUM = 1")

      @vat = vat_table[0].to_i
    end

  end
end

