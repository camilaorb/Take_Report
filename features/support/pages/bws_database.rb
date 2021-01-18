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

    ############### Verify Data ######################

    ##### Merchandise Hierarchy #####

    ## MH Division ##

    def division_id
      last_id = @connection.select_one("Select * from (select DIVISION from DIVISION order by DIVISION DESC) WHERE ROWNUM = 1")
      if last_id.nil?
        @new_id = 1
      else
        @new_id = (last_id[0] + 1).to_s
      end
    end

    def verify_mh_division_table(div_id, division_name, buyer, merchandiser)
      new_division = @connection.select_one("Select * from DIVISION WHERE DIVISION = #{div_id}")
      raise "New Division no '#{div_id}' was not created" if new_division.nil?
      raise "Name is wrong. Expected:'#{division_name}' Actual:'#{new_division[1]}'" unless new_division[1] == division_name
      raise "Buyer is wrong. Expected:'#{buyer.to_i}' Actual:'#{new_division[2]}'" unless new_division[2] == buyer.to_i
      raise "Merchandiser is wrong. Expected:'#{merchandiser.to_i}' Actual:'#{new_division[3]}'" unless new_division[3] == merchandiser.to_i
    end

    def verify_delete_division_table(div_id)
      new_division = @connection.select_one("Select * from DIVISION WHERE DIVISION = #{div_id}")
      raise "The Division no '#{div_id}' was not deleted" unless new_division.nil?
    end

    ## Department ##

    def department_id
      last_id = @connection.select_one("Select * from (select GROUP_NO from GROUPS order by GROUP_NO DESC) WHERE ROWNUM = 1")
      if last_id.nil?
        @new_id = 1
      else
        @new_id = (last_id[0] + 1).to_s
      end
    end

    def verify_department_table(department_id, department_name, buyer, merchandiser)
      new_department = @connection.select_one("Select * from GROUPS WHERE GROUP_NO = #{department_id}")
      raise "New Department no '#{department_id}' was not created" if new_department.nil?
      raise "Name is wrong. Expected:'#{department_name}' Actual:'#{new_department[1]}'" unless new_department[1] == department_name
      raise "Buyer is wrong. Expected:'#{buyer.to_i}' Actual:'#{new_department[2]}'" unless new_department[2] == buyer.to_i
      raise "Merchandiser is wrong. Expected:'#{merchandiser.to_i}' Actual:'#{new_department[3]}'" unless new_department[3] == merchandiser.to_i
    end

    def verify_delete_department_table(department_id)
      new_department = @connection.select_one("Select * from GROUPS WHERE GROUP_NO = #{department_id}")
      raise "The Department no '#{department_id}' was not deleted" unless new_department.nil?
    end

    ## Category ##

    def category_id(subdept_id)
      last_id = @connection.select_one("Select * from (select CLASS from CLASS WHERE DEPT = (#{subdept_id}) order by CLASS DESC) WHERE ROWNUM = 1")
      if last_id.nil?
        @new_id = 1
      else
        @new_id = (last_id[0] + 1).to_s
      end
    end

    def verify_category_table(category_id, subdept_id, category_name)
      new_category = @connection.select_one("Select * from CLASS WHERE DEPT = (#{subdept_id}) AND CLASS = (#{category_id})")
      raise "New Category no '#{category_id}' was not created" if new_category.nil?
      raise "Name is wrong. Expected:'#{category_name}' Actual:'#{new_category[2]}'" unless new_category[2] == category_name
    end

    def verify_dlyprg_table(key_value)
      #Category, Subcategory and subsubdept goes to Daily Purge table and is necessary run a batch
      item = @connection.select_one("Select * from daily_purge where KEY_VALUE = '(#{key_value})'")
      raise "The value was not on Daily Purge table" unless item.nil?
    end

    ## SubCategory ##

    def subcategory_id(subdept_id, category_id)
      last_id = @connection.select_one("Select *from (select SUBCLASS from SUBCLASS WHERE DEPT = (#{subdept_id}) AND CLASS = (#{category_id}) order by SUBCLASS DESC) WHERE ROWNUM = 1")
      if last_id.nil?
        @new_id = 1
      else
        @new_id = (last_id[0] + 1).to_s
      end
    end

    def verify_subcategory_table(subcategory_id, subdept_id, category_id, subcategory_name)
      new_subcategory = @connection.select_one("Select * from SUBCLASS WHERE DEPT = (#{subdept_id}) AND CLASS = (#{category_id}) AND SUBCLASS = (#{subcategory_id})")
      raise "Subcategory no '#{subcategory_id}' was not created" if new_subcategory.nil?
      raise "Name is wrong. Expected:'#{subcategory_name}' Actual:'#{new_subcategory[3]}'" unless new_subcategory[3] == subcategory_name
    end

    ## SubDepartment ##

    def subdpt_id
      last_id = @connection.select_one("Select * from (select DEPT from DEPS order by DEPT DESC) WHERE ROWNUM = 1")
      if last_id.nil?
        @new_id = 1
      else
        @new_id = (last_id[0] + 1).to_s
      end
    end

    def verify_subsubdept_table(subdept_id, subdept_name, buyer, merch, profit_calc, purchase, dept, mark_retail, mark_cost,
                                total_market_amount, markup_calc, otb_calc, maximum_average, average_tolerance)
      new_subsubdept = @connection.select_one("Select * from DEPS WHERE DEPT = (#{subdept_id})")
      raise "New Sub-Department no '#{subdept_id}' was not created" if new_subsubdept.nil?
      raise "Name is wrong. Expected:'#{subdept_name}' Actual:'#{new_subsubdept[1]}'" unless new_subsubdept[1] == subdept_name
      raise "Name is wrong. Expected:'#{buyer}' Actual:'#{new_subsubdept[2]}'" unless new_subsubdept[2] == buyer.to_i
      raise "Name is wrong. Expected:'#{merch}' Actual:'#{new_subsubdept[3]}'" unless new_subsubdept[3] == merch.to_i
      raise "Name is wrong. Expected:'#{profit_calc}' Actual:'#{new_subsubdept[4]}'" unless new_subsubdept[4] == profit_calc.to_i
      raise "Name is wrong. Expected:'#{purchase}' Actual:'#{new_subsubdept[5]}'" unless new_subsubdept[5] == purchase.to_i
      raise "Name is wrong. Expected:'#{dept}' Actual:'#{new_subsubdept[6]}'" unless new_subsubdept[6] == dept.to_i
      raise "Name is wrong. Expected:'#{mark_retail}' Actual:'#{new_subsubdept[7]}'" unless new_subsubdept[7] == mark_retail.to_f
      raise "Name is wrong. Expected:'#{mark_cost}' Actual:'#{new_subsubdept[8]}'" unless new_subsubdept[8] == mark_cost.to_i
      raise "Name is wrong. Expected:'#{total_market_amount}' Actual:'#{new_subsubdept[9]}'" unless new_subsubdept[9] == total_market_amount.to_i
      raise "Name is wrong. Expected:'#{markup_calc}' Actual:'#{new_subsubdept[10]}'" unless new_subsubdept[10] == markup_calc
      raise "Name is wrong. Expected:'#{otb_calc}' Actual:'#{new_subsubdept[11]}'" unless new_subsubdept[11] == otb_calc
      raise "Name is wrong. Expected:'#{maximum_average}' Actual:'#{new_subsubdept[12]}'" unless new_subsubdept[12] == maximum_average.to_i
      raise "Name is wrong. Expected:'#{average_tolerance}' Actual:'#{new_subsubdept[13]}'" unless new_subsubdept[13] == average_tolerance.to_i
    end

    def verify_edit_subsubdept_table(subdept_id, subdept_name)
      new_subsubdept = @connection.select_one("Select * from DEPS WHERE DEPT = (#{subdept_id})")
      raise "New Sub-Department no '#{subdept_id}' was not created" if new_subsubdept.nil?
      raise "Name is wrong. Expected:'#{subdept_name}' Actual:'#{new_subsubdept[1]}'" unless new_subsubdept[1] == subdept_name
    end

    def verify_vat_table(subdept_id, vat_region, vat_code, vat_type)
      new_vat = @connection.select_one("Select * from VAT_DEPS where DEPT = (#{subdept_id}) AND VAT_REGION = (#{vat_region})
                                       AND VAT_CODE = '#{vat_code}' AND VAT_TYPE = '#{vat_type}'")
      raise "New VAT to region no '#{vat_region}' and code '#{vat_code}' related to sub-department no '#{subdept_id}' was not created" if new_vat.nil?
    end

    def verify_delete_vat_table(subdept_id, vat_region, vat_code, vat_type)
      new_vat = @connection.select_one("Select * from VAT_DEPS where DEPT = (#{subdept_id}) AND VAT_REGION = (#{vat_region})
                                       AND VAT_CODE = '#{vat_code}' AND VAT_TYPE = '#{vat_type}'")
      raise "The Vat to region no '#{vat_region}' and code '#{vat_code}' related to sub-department no '#{subdept_id}' was not deleted" unless new_vat.nil?
    end

    def verify_merch_hier_table(subdept_id, info, category, subcategory, required)
      new_merch_hier = @connection.select_one("Select DEPT, INFO, CLASS, SUBCLASS, REQUIRED_IND from MERCH_HIER_DEFAULT where DEPT = (#{subdept_id})")
      raise "Merchandise Hierarchy Default info '#{info}' related to sub-department no '#{subdept_id}' was not created" if new_merch_hier.nil?
      raise "Info is wrong. Expected:'#{info}' Actual:'#{new_merch_hier[1]}'" unless new_merch_hier[1] == info
      raise "Category is wrong. Expected:'#{category}' Actual:'#{new_merch_hier[2]}'" unless new_merch_hier[2] == category.to_i
      raise "Subcategory is wrong. Expected:'#{subcategory}' Actual:'#{new_merch_hier[3]}'" unless new_merch_hier[3] == subcategory.to_i
      raise "Require is wrong. Expected:'#{required}' Actual:'#{new_merch_hier[4]}'" unless new_merch_hier[4] == required
    end

    ##### Diffs #####

    def diff_group_id
      last_id = @connection.select_one("Select * from (select DIFF_GROUP_ID from DIFF_GROUP_HEAD order by DIFF_GROUP_ID DESC) WHERE ROWNUM = 1")
      if last_id.nil?
        @new_id = 1
      else
        @new_id = (last_id[0].to_i) + 1
      end
    end

    def verify_diff_group_table(new_diff_group_id, group_name, type)
      new_diff_group = @connection.select_one("Select  DIFF_TYPE , DIFF_GROUP_DESC from DIFF_GROUP_HEAD WHERE DIFF_GROUP_ID = #{new_diff_group_id}")
      raise "Diff Group no '#{new_diff_group_id}' was not created" if new_diff_group.nil?
      raise "Group Description is wrong. Expected:'#{group_name}' Actual:'#{new_diff_group[1]}'" unless new_diff_group[1] == group_name
      raise "Type is wrong. Expected:'#{type}' Actual:'#{new_diff_group[0]}'" unless new_diff_group[0] == type
    end

    def verify_diff_group_with_item(diff_group_id)
      diff_group = @connection.select_one("Select DIFF_GROUP_ID from DIFF_GROUP_HEAD WHERE DIFF_GROUP_ID = #{diff_group_id}")
      raise "The Diff Group no '#{diff_group_id}' was deleted" unless diff_group[1] == diff_group[1]
    end

    def verify_delete_diff_group_table(diff_group_id)
      diff_group = @connection.select_one("Select * from DIFF_GROUP_HEAD WHERE DIFF_GROUP_ID = #{diff_group_id}")
      raise "The Diff Group no '#{diff_group_id}' was not deleted" unless diff_group.nil?
    end

    ### Diff Group Detail ###

    def group_detail_id(diff_group_id)
      last_id = @connection.select_one("Select * from (select DISPLAY_SEQ from DIFF_GROUP_DETAIL WHERE DIFF_GROUP_ID = (#{diff_group_id}) order by DISPLAY_SEQ DESC) WHERE ROWNUM = 1")
      if last_id.nil?
        @new_id = 1
      else
        @new_id = (last_id[0].to_i) + 1
      end
    end

    def verify_diff_group_detail_table(diff_group_detail_id, diff, sequence)
      diff_group_detail = @connection.select_one("Select DIFF_GROUP_ID, DIFF_ID, DISPLAY_SEQ from DIFF_GROUP_DETAIL WHERE DIFF_GROUP_ID = #{diff_group_detail_id}")
      raise "New Diff Group Detail no '#{diff_group_detail_id}' was not created" if diff_group_detail.nil?
      raise "Sequence is wrong. Expected:'#{diff}' Actual:'#{diff_group_detail[2]}'" unless diff_group_detail[1] == diff
      raise "Sequence is wrong. Expected:'#{sequence}' Actual:'#{diff_group_detail[4]}'" unless diff_group_detail[2] == sequence.to_i
    end

    def verify_delete_diff_group_detail_table(diff_group_detail_id, sequence)
      diff_group_detail = @connection.select_one("Select * from DIFF_GROUP_DETAIL WHERE DIFF_GROUP_ID = #{diff_group_detail_id} AND DISPLAY_SEQ = #{sequence}")
      raise "New Diff Group Detail no '#{diff_group_detail_id}' was not deleted" unless diff_group_detail.nil?
    end

    ### Diff Range ###

    def diff_range_id
      last_id = @connection.select_one("Select * from (select DIFF_RANGE from DIFF_RANGE_HEAD order by DIFF_RANGE DESC) WHERE ROWNUM = 1")
      if last_id.nil?
        @new_id = 1
      else
        @new_id = (last_id[0].to_i) + 1
      end
    end

    def verify_diff_range_header_table(diff_range_id, diff_range_desc, diff_group_1, diff_group_2, diff_range_type)
      diff_range_head = @connection.select_one("Select * from DIFF_RANGE_HEAD where DIFF_RANGE = #{diff_range_id}")
      raise "New Diff Range no '#{diff_range_id}' was not created" if diff_range_head.nil?
      raise "Diff Range Description is wrong. Expected:'#{diff_range_desc}' Actual:'#{diff_range_head[1]}'" unless diff_range_head[1] == diff_range_desc
      raise "Diff Group 1 is wrong. Expected:'#{diff_group_1}' Actual:'#{diff_range_head[2]}'" unless diff_range_head[2] == diff_group_1
      raise "Diff Group 2 is wrong. Expected:'#{diff_group_2}' Actual:'#{diff_range_head[3]}'" unless diff_range_head[3] == diff_group_2
      raise "Diff Range Type is wrong. Expected:'#{diff_range_type}' Actual:'#{diff_range_head[5]}'" unless diff_range_head[5] == diff_range_type
    end

    def verify_diff_range_detail_table(diff_range_id, detail_1, detail_2, ratio)
      diff_range_head = @connection.select_one("Select DIFF_1, DIFF_2, QTY from DIFF_RANGE_DETAIL where DIFF_RANGE = #{diff_range_id} and DIFF_1 = '#{detail_1}'")
      raise "New Diff Range Detail no '#{diff_range_id}' was not created" if diff_range_head.nil?
      raise "Detail 1 is wrong. Expected:'#{detail_1}' Actual:'#{diff_range_head[0]}'" unless diff_range_head[0] == detail_1
      raise "Detail 2 is wrong. Expected:'#{detail_2}' Actual:'#{diff_range_head[1]}'" unless diff_range_head[1] == detail_2
      raise "Ratio is wrong. Expected:'#{ratio}' Actual:'#{diff_range_head[2]}'" unless diff_range_head[2] == ratio.to_i
    end

    def verify_delete_diff_range_detail_table(diff_range_id, detail_1)
      diff_range_detail = @connection.select_one("Select * from  DIFF_RANGE_DETAIL where DIFF_RANGE = #{diff_range_id} and DIFF_1 = '#{detail_1}'")
      raise "Diff Range Detail no '#{diff_range_id}' was not deleted" unless diff_range_detail.nil?
    end

    ### Diff Ratio ###

    def verify_diff_ratio_table(diff_ratio_id, description, dept, ratio_class, subclass, ratio_group1, ratio_group2, ratio_group3, review)
      diff_ratio_head = @connection.select_one("Select * from DIFF_RATIO_HEAD where DIFF_RATIO_ID = #{diff_ratio_id}")
      raise "New Diff Group was not created" if diff_ratio_head.nil?
      raise "Description is wrong. Expected:'#{description}' Actual:'#{diff_ratio_head[1]}'" unless diff_ratio_head[1] == description
      raise "Department is wrong. Expected:'#{dept}' Actual:'#{diff_ratio_head[2]}'" unless diff_ratio_head[2] == dept.to_i
      raise "Class is wrong. Expected:'#{ratio_class}' Actual:'#{diff_ratio_head[3]}'" unless diff_ratio_head[3] == ratio_class.to_i
      raise "Subclass is wrong. Expected:'#{subclass}' Actual:'#{diff_ratio_head[4]}'" unless diff_ratio_head[4] == subclass.to_i
      raise "Group 1 is wrong. Expected:'#{ratio_group1}' Actual:'#{diff_ratio_head[5]}'" unless diff_ratio_head[5] == ratio_group1
      raise "Group 2 is wrong. Expected:'#{ratio_group2}' Actual:'#{diff_ratio_head[6]}'" unless diff_ratio_head[6] == ratio_group2
      raise "Group 3 is wrong. Expected:'#{ratio_group3}' Actual:'#{diff_ratio_head[7]}'" unless diff_ratio_head[7] == ratio_group3
      raise "Review weeks is wrong. Expected:'#{review}' Actual:'#{diff_ratio_head[17]}'" unless diff_ratio_head[17] == review.to_i
    end

    def verify_delete_diff_ratio_table(diff_ratio_id)
      diff_group_detail = @connection.select_one("Select * from DIFF_GROUP_DETAIL WHERE DIFF_GROUP_ID = #{diff_ratio_id}")
      raise "New Diff Ratio no '#{diff_ratio_id}' Detail was not deleted" unless diff_group_detail.nil?
    end

    #### DIFF Data ###

    def verify_diff_type_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      diff_type = xls.sheet(0).cell(2, 2)
      description = xls.sheet(0).cell(2, 3)
      diff_type_table = @connection.select_one("select DIFF_TYPE, diff_type_desc from DIFF_TYPE where diff_type = '#{diff_type}';")
      raise "New Diff Type '#{diff_type}' - '#{description}' was not created" if diff_type_table.nil?
      raise "Description is not like Expected:'#{description}' Actual:'#{diff_type_table[1]}'" unless description == diff_type_table[1]
    end

    def verify_delete_diff_type_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      diff_type = xls.sheet(0).cell(2, 2)
      diff_type_table = @connection.select_one("select DIFF_TYPE, diff_type_desc from DIFF_TYPE where diff_type = '#{diff_type}'")
      raise "New Diff Type '#{diff_type}' Detail was not deleted" unless diff_type_table.nil?
    end

    def verify_diff_id_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      diff_id = xls.sheet(2).cell(2, 2)
      description = xls.sheet(2).cell(2, 3)
      diff_type = xls.sheet(2).cell(2, 4)
      #ind_code = xls.sheet(2).cell(2, 2)
      #ind_subgroup = xls.sheet(2).cell(2, 2)
      diff_id_table = @connection.select_one("select DIFF_ID, DIFF_TYPE, DIFF_DESC, INDUSTRY_CODE, INDUSTRY_SUBGROUP from DIFF_IDS where DIFF_ID = '#{diff_id}'")
      raise "New Diff ID '#{diff_id}' - '#{description}' was not created" if diff_id_table.nil?
      raise "Diff Type is not like Expected:'#{diff_type}' Actual:'#{diff_id_table[1]}'" unless diff_type == diff_id_table[1]
      raise "Description is not like Expected:'#{description}' Actual:'#{diff_id_table[2]}'" unless description == diff_id_table[2]
      #raise "Industry Code Type is not like Expected:'#{ind_code}' Actual:'#{diff_id_table[3]}'" unless ind_code == diff_id_table[3]
      #raise "Industry Subgroup Type is not like Expected:'#{ind_subgroup}' Actual:'#{diff_id_table[4]}'" unless ind_subgroup == diff_id_table[4]
    end

    def verify_delete_id_type_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      diff_id = xls.sheet(2).cell(2, 2)
      diff_id_table = @connection.select_one("select * from DIFF_IDS where diff_type = '#{diff_id}'")
      raise "New Diff Type '#{diff_id}' Detail was not deleted" unless diff_id_table.nil?
    end

    #### UDAs ###

    def verify_last_uda_id
      @verify_id = @connection.select_one("Select * from (select UDA_ID from UDA order by UDA_ID desc) WHERE ROWNUM = 1")
      @last_uda_id = @verify_id[0].to_i
    end

    def verify_uda_table(last_uda_id, uda_desc, display_type)
      @uda_id = (last_uda_id + 1).to_s
      new_uda = @connection.select_one("Select * from UDA where UDA_ID = (#{@uda_id})")
      raise "New UDA was not created" if new_uda.nil?
      raise "Name is wrong. Expected:'#{uda_desc}' Actual:'#{new_uda[1]}'" unless new_uda[1] == uda_desc
      raise "Type is wrong. Expected:'#{display_type}' Actual:'#{new_uda[3]}'" unless new_uda[3] == display_type
    end

    def verify_change_uda_table(last_uda_id, uda_desc, display_type)
      changed_uda = @connection.select_one("Select * from UDA where UDA_ID = (#{last_uda_id})")
      raise "New UDA was not created" if changed_uda.nil?
      raise "Name is wrong. Expected:'#{uda_desc}' Actual:'#{changed_uda[1]}'" unless changed_uda[1] == uda_desc
      raise "Type is wrong. Expected:'#{display_type}' Actual:'#{changed_uda[3]}'" unless changed_uda[3] == display_type
    end

    def verify_uda_delete(last_uda_id)
      @uda_id = (last_uda_id + 1).to_s
      new_uda = @connection.select_one("Select * from UDA where UDA_ID = (#{@uda_id})")
      raise "The UDA was not deleted" unless new_uda.nil?
    end


    def verify_last_uda_value_id
      @verify_id = @connection.select_one("Select * from (select UDA_VALUE from UDA_VALUES order by UDA_VALUE desc) WHERE ROWNUM = 1")
      @last_uda_value_id = @verify_id[0].to_i
    end

    def verify_uda_value_table(last_uda_value_id, uda_value_desc, uda_id)
      @uda_value_id = (last_uda_value_id[0].to_i + 1).to_s
      new_uda_value = @connection.select_one("Select * from UDA_VALUES where UDA_ID = (#{@uda_value_id})")
      raise "New UDA was not created" if new_uda_value.nil?
      raise "Name is wrong. Expected:'#{uda_value_desc}' Actual:'#{new_uda_value[1]}'" unless new_uda_value[1] == uda_value_desc
      raise "Type is wrong. Expected:'#{uda_id}' Actual:'#{new_uda_value[3]}'" unless new_uda_value[3] == uda_id
    end

    def verify_change_uda_value_table(last_uda_value_id, uda_value_desc, uda_id)
      changed_uda_value = @connection.select_one("Select * from UDA_VALUES where UDA_ID = (#{last_uda_value_id})")
      raise "New UDA was not created" if changed_uda_value.nil?
      raise "Name is wrong. Expected:'#{uda_value_desc}' Actual:'#{changed_uda_value[1]}'" unless changed_uda_value[1] == uda_value_desc
      raise "Type is wrong. Expected:'#{uda_id}' Actual:'#{changed_uda_value[3]}'" unless changed_uda_value[3] == uda_id
    end

    def verify_uda_value_delete(last_uda_value_id)
      @uda_value_id = (last_uda_value_id[0].to_i + 1).to_s
      new_uda_value = @connection.select_one("Select * from UDA_VALUES where UDA_ID = (#{uda_value_id})")
      raise "The UDA was not deleted" unless new_uda_value.nil?
    end

    #### Banners and Channels Data ###

    def verify_banner_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      banner_id = xls.sheet(0).cell(2, 2)
      description = xls.sheet(0).cell(2, 3)
      banner_table = @connection.select_one("SELECT * FROM BANNER where BANNER_ID = '#{banner_id}'")
      raise "New Banner '#{banner_id}' - '#{description}' was not created" if banner_table.nil?
      raise "Description is not like Expected:'#{description}' Actual:'#{banner_table[1]}'" unless description == banner_table[1]
    end

    def verify_delete_banner_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      diff_type = xls.sheet(0).cell(2, 2)
      diff_type_table = @connection.select_one("SELECT * FROM BANNER where BANNER_ID = '#{banner_id}'")
      raise "New Diff Type '#{diff_type}' Detail was not deleted" unless diff_type_table.nil?
    end


    #### Organizational Hierarchy ###
    # create #
    def verify_org_unit_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      org_unit_id = xls.sheet(0).cell(2, 2)
      set_of_books_id = xls.sheet(0).cell(2, 3)
      dis = xls.sheet(0).cell(2, 4)
      org_unit_table = @connection.select_one("select * from ORG_UNIT where org_unit_id = '#{org_unit_id}'")

      raise "New Org_Unit_ID '#{org_unit_id}' - '#{dis}' was not created" if org_unit_table.nil?
      raise "Org_Unit_ID is not like Expected:'#{org_unit_id}' Actual:'#{org_unit_table[0]}'" unless org_unit_id == org_unit_table[0]
      raise "Description is not like Expected:'#{dis}' Actual:'#{org_unit_table[1]}'" unless dis == org_unit_table[1]
      raise "Set_Of_Book_Id is not like expected:'#{set_of_books_id}' Actual: '#{org_unit_table[2]}'" unless set_of_books_id.to_i == org_unit_table[2]
    end

    #delete#
    def verify_delete_org_unit_id_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      org_unit_id = xls.sheet(0).cell(2, 2)
      org_unit_table = @connection.select_one("select * from org_unit where org_unit_id = '#{org_unit_id}'")
      raise "Org_Unit_ID '#{org_unit_id}' Detail was not deleted" unless org_unit_table.nil?
    end

    #edit   - Please change method name
    def verify_edit_diff_type_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      org_unit_id = xls.sheet(0).cell(2, 2)
      dis = xls.sheet(0).cell(2, 4)
      org_unit_table = @connection.select_one("select * from org_unit where org_unit_id = '#{org_unit_id}'")
      raise "Org_Unit_ID '#{org_unit_id}' Detail was not updated" if org_unit_table.nil?
      raise "Update was not successful" unless dis == org_unit_table[1]
    end


    #### Transfer Entity ####
    # create #
    def verify_transfer_entity_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      tsf_entity_id = xls.sheet(0).cell(2, 2)
      tsf_entity_desc = xls.sheet(0).cell(2, 3)
      tsf_entity_table = @connection.select_one("Select * from TSF_ENTITY WHERE TSF_ENTITY_ID = '#{tsf_entity_id}'")

      raise "New tsf_entity_id '#{tsf_entity_id}' - '#{tsf_entity_desc}' was not created" if tsf_entity_table.nil?
      raise "tsf_entity_id is not like Expected:'#{tsf_entity_id}' Actual:'#{tsf_entity_table[0]}'" unless tsf_entity_id == tsf_entity_table[0]
      raise "tsf_entity_description is not like Expected:'#{tsf_entity_desc}' Actual:'#{tsf_entity_table[1]}'" unless tsf_entity_desc == tsf_entity_table[1]
    end

    #edit
    def verify_edit_tsf_entity_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      tsf_entity_id = xls.sheet(0).cell(2, 2)
      tsf_entity_desc = xls.sheet(0).cell(2, 3)
      tsf_entity_table = @connection.select_one("Select * from TSF_ENTITY WHERE TSF_ENTITY_ID = '#{tsf_entity_id}'")
      raise "tsf_entity_id '#{org_unit_id}' Detail was not updated" if tsf_entity_table.nil?
      raise "Update was not successful" unless tsf_entity_desc == tsf_entity_table[1]
    end

    # delete #
    def verify_delete_transfer_entity_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      tsf_entity_id = xls.sheet(0).cell(2, 2)
      tsf_type_table = @connection.select_one("select TSF_ENTITY_ID, tsf_entity_desc from TSF_ENTITY where tsf_entity_id = '#{tsf_entity_id}'")
      raise "New TSF Type '#{tsf_type}' Detail was not deleted" unless tsf_type_table.nil?
    end

    ##### Store-Format ######
    # create #
    def verify_store_format_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      store_format_number = xls.sheet(0).cell(2, 2)
      store_format_name = xls.sheet(0).cell(2, 3)

      store_format_table = @connection.select_one("select * from STORE_FORMAT where STORE_FORMAT = '#{store_format_number}'")

      raise "New StoreFormat_Number '#{store_format_number}' - '#{store_format_name}' was not created" if store_format_table.nil?
      raise "StoreFormat_Number is not like Expected:'#{store_format_number}' Actual:'#{store_format_table[0]}'" unless store_format_number == store_format_table[0]
      raise "Description is not like Expected:'#{store_format_name}' Actual:'#{store_format_table[1]}'" unless store_format_name == store_format_table[1]
    end

    #edit
    def verify_edit_store_format_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      store_format_number = xls.sheet(0).cell(2, 2)
      store_format_name = xls.sheet(0).cell(2, 3)

      store_format_table = @connection.select_one("select * from STORE_FORMAT where STORE_FORMAT = '#{store_format_number}'")

      raise "store_format_number '#{store_format_number}' Detail was not updated" if store_format_table.nil?
      raise "Update was not successful" unless store_format_name == store_format_table[1]
    end

    # delete #
    def verify_delete_store_format_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      store_format_number = xls.sheet(0).cell(2, 2)
      store_format_table = @connection.select_one("select * from STORE_FORMAT where STORE_FORMAT = '#{store_format_number}'")
      raise "store_format_number #{store_format_number}' Detail was not deleted" unless store_format_table.nil?
    end

    #### Supplier Trait ####
    # create #
    def verify_supplier_trait_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      supplier_trait_number = xls.sheet(0).cell(2, 2)
      supplier_trait_description = xls.sheet(0).cell(2, 3)

      supplier_trait_table = @connection.select_one("select * from sup_traits where SUP_TRAIT = '#{supplier_trait_number}'")

      raise "New supplier_trait_number '#{supplier_trait_number}' - '#{supplier_trait_description}' was not created" if supplier_trait_table.nil?
      raise "supplier_trait_number is not like Expected:'#{supplier_trait_number}' Actual:'#{supplier_trait_table[0]}'" unless supplier_trait_number == supplier_trait_table[0]
      raise "Description is not like Expected:'#{supplier_trait_description}' Actual:'#{supplier_trait_table[1]}'" unless supplier_trait_description == supplier_trait_table[1]
    end

    #edit
    def verify_edit_supplier_trait_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      supplier_trait_number = xls.sheet(0).cell(2, 2)
      supplier_trait_description = xls.sheet(0).cell(2, 3)

      supplier_trait_table = @connection.select_one("select * from sup_traits where SUP_TRAIT = '#{supplier_trait_number}'")

      raise "supplier_trait_number '#{supplier_trait_number}' Detail was not updated" if supplier_trait_table.nil?
      raise "Update was not successful" unless supplier_trait_description == supplier_trait_table[1]
    end

    # delete #
    def verify_delete_supplier_trait_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      supplier_trait_number = xls.sheet(0).cell(2, 2)
      supplier_trait_table = @connection.select_one("select * from sup_traits where SUP_TRAIT = '#{supplier_trait_number}'")
      raise "supplier_trait_number #{supplier_trait_number}' Detail was not deleted" unless supplier_trait_table.nil?
    end

    #### Transfer Zone ####
    # create #
    def verify_transfer_zone_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      transfer_zone_number = xls.sheet(0).cell(2, 2)
      transfer_zone_description = xls.sheet(0).cell(2, 3)

      transfer_zone_table = @connection.select_one("select * from TSFZONE where TRANSFER_ZONE = '#{transfer_zone_number}'")

      raise "New transfer_zone_number '#{transfer_zone_number}' - '#{transfer_zone_description}' was not created" if transfer_zone_table.nil?
      raise "transfer_zone_number is not like Expected:'#{transfer_zone_number}' Actual:'#{transfer_zone_table[0]}'" unless transfer_zone_number == transfer_zone_table[0]
      raise "Description is not like Expected:'#{transfer_zone_description}' Actual:'#{transfer_zone_table[1]}'" unless transfer_zone_description == transfer_zone_table[1]
    end

    #edit
    def verify_edit_transfer_zone_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      transfer_zone_number = xls.sheet(0).cell(2, 2)
      transfer_zone_description = xls.sheet(0).cell(2, 3)

      transfer_zone_table = @connection.select_one("select * from TSFZONE where TRANSFER_ZONE = '#{transfer_zone_number}'")

      raise "transfer_zone_number '#{transfer_zone_number}' Detail was not updated" if transfer_zone_table.nil?
      raise "Update was not successful" unless transfer_zone_description == transfer_zone_table[1]
    end

    # delete #
    def verify_delete_transfer_zone_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      transfer_zone_number = xls.sheet(0).cell(2, 2)
      transfer_zone_table = @connection.select_one("select * from TSFZONE where TRANSFER_ZONE = '#{transfer_zone_number}'")

      raise "transfer_zone_number #{transfer_zone_number}' Detail was not deleted" unless transfer_zone_table.nil?
    end

    ## vat_codes ##
    # create #
    def verify_vat_codes_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      vat_codes_number = xls.sheet(0).cell(2, 2)
      vat_codes_description = xls.sheet(0).cell(2, 3)

      vat_codes_table = @connection.select_one("select * from vat_codes where VAT_CODE = '#{vat_codes_number}'")

      raise "New vat_codes_number '#{vat_codes_number}' - '#{vat_codes_description}' was not created" if vat_codes_table.nil?
      raise "vat_codes_number is not like Expected:'#{vat_codes_number}' Actual:'#{vat_codes_table[0]}'" unless vat_codes_number == vat_codes_table[0]
      raise "Description is not like Expected:'#{vat_codes_description}' Actual:'#{vat_codes_table[1]}'" unless vat_codes_description == vat_codes_table[1]
    end

    #edit
    def verify_edit_vat_codes_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      vat_codes_number = xls.sheet(0).cell(2, 2)
      vat_codes_description = xls.sheet(0).cell(2, 3)
      vat_codes_table = @connection.select_one("select * from vat_codes where VAT_CODE = '#{vat_codes_number}'")

      raise "vat_codes_number '#{vat_codes_number}' Detail was not updated" if vat_codes_table.nil?
      raise "Update was not successful" unless vat_codes_description == vat_codes_table[1]

    end

    #delete
    def verify_delete_vat_codes_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      vat_codes_number = xls.sheet(0).cell(2, 2)
      vat_codes_table = @connection.select_one("select * from vat_codes where VAT_CODE = '#{vat_codes_number}'")

      raise "vat_codes_number #{vat_codes_number}' Detail was not deleted" unless vat_codes_table.nil?
    end


    ## uda lov & ff##
    # create #
    def verify_create_uda_table(file)

      #uda - id needs to manually add by checking last uda id at the moment

      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      uda_id = xls.sheet(0).cell(2, 2)
      uda_description = xls.sheet(0).cell(2, 3)
      uda_codes_table = @connection.select_one("select * from uda where UDA_DESC = '#{uda_description}'")

      raise "New uda_table '#{uda_id}' - '#{uda_description}' was not created" if uda_codes_table.nil?
    end

    #Update
    def verify_update_uda_table(file)

      #For UDA update,First UDA ID, generated by UDA-Table in database is required,

      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      uda_id_number = xls.sheet(0).cell(2, 2)
      uda_description = xls.sheet(0).cell(2, 3)
      uda_table = @connection.select_one("select * from uda where UDA_ID = '#{uda_id_number}'")

      raise "uda_id_number '#{uda_id_number}' Detail was not updated" if uda_table.nil?
      raise "Update was not successful" unless uda_description == uda_table[1]
    end


    #Delete_ff
    def verify_delete_uda_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      uda_id_number = xls.sheet(0).cell(2, 2)
      uda_codes_table = @connection.select_one("select * from uda where UDA_ID = '#{uda_id_number}'")

      raise "uda_id_number #{uda_id_number}' Detail was not deleted" unless uda_codes_table.nil?
    end

    #Delete_LOV
    def verify_delete_lov_uda_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      uda_id_number = xls.sheet(0).cell(2, 2)
      uda_codes_table = @connection.select_one("select * from uda where UDA_ID = '#{uda_id_number}'")

      raise "UDA_ID #{uda_id_number} is Deleted" if uda_codes_table.nil?
    end

    ##uda_values##
    #create#
    def verify_create_uda_values_table(file)

      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      uda_id = xls.sheet(2).cell(2, 2)
      uda_value = xls.sheet(2).cell(2, 3)
      uda_value_table = @connection.select_one("select * from uda_values where uda_id = '#{uda_id}' and uda_value = '#{uda_value}'")

      raise "New uda_value - '#{uda_value}' for uda_id  - '#{uda_id}' -  was not created" if uda_value_table.nil?
    end

    # Update #
    def verify_update_uda_values_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      uda_id = xls.sheet(2).cell(2, 2)
      uda_value = xls.sheet(2).cell(2, 3)
      uda_value_description = xls.sheet(2).cell(2, 4)

      uda_value_table = @connection.select_one("select * from uda_values where uda_id = '#{uda_id}' and uda_value = '#{uda_value}'")

      raise "New uda_value - '#{uda_value}' for uda_id  - '#{uda_id}' -  was not created" if uda_value_table.nil?
      raise "Update was not successful" unless uda_value_description == uda_value_table[2]
    end

    #Delete#
    def verify_delete_uda_values_table(file)
      xls = Roo::Spreadsheet.open("#{Dir.pwd}/resources/upload_DB_data/#{file}")
      uda_id = xls.sheet(2).cell(2, 2)
      uda_value = xls.sheet(2).cell(2, 3)
      uda_value_description = xls.sheet(2).cell(2, 4)

      uda_value_table = @connection.select_one("select * from uda_values where uda_id = '#{uda_id}' and uda_value = '#{uda_value}'")

      raise "New uda_value - '#{uda_value}' for uda_id  - '#{uda_id}' -  was not created" if uda_value_table.nil?
      raise "Update was not successful" unless uda_value_description == uda_value_table[2]
    end

    ################## Organizational_Hierarchy ###################

    # Division #
    def verify_division_create(division, division_name)
      division_table = @connection.select_one("select * from chain where chain = '#{division}'")
      raise "New Division '#{division_name}' Detail was not created" if division_table.nil?
    end

    def verify_division_edit(division, division_name)
      division_table = @connection.select_one("select * from chain where chain = '#{division}'")
      raise "Edit Division '#{division_name}' Detail was not updated" unless division_name = division_table[1]
    end

    def verify_division_delete(division, division_name)
      division_table = @connection.select_one("select * from chain where chain = '#{division}'")
      raise "Division '#{division_name}' Detail was not deleted" unless division_table.nil?
    end


    ## Region ##
    def verify_region_create(region, region_name)
      region_table = @connection.select_one("select * from region where region = '#{region}'")
      raise "New region '#{region_name}' Detail was not created" if region_table.nil?
    end

    def verify_region_edit(region, name)
      region_table = @connection.select_one("select * from region where region = '#{region}'")
      raise "Update Region '#{name}' Detail was not updated" unless name = region_table[1]
    end

    def verify_region_delete(region)
      region_table = @connection.select_one("select * from region where region = '#{region}'")
      raise "Region '#{region}' Detail was not deleted" unless region_table.nil?
    end

    ##Area##
    def verify_area_create(area, area_name)
      area_table = @connection.select_one("select * from district where district = '#{area}'")
      raise "New area '#{area_name}' Detail was not created" if area_table.nil?
    end

    def verify_area_edit(area, area_name)
      area_table = @connection.select_one("select * from district where district = '#{area}'")
      raise "Update Area '#{area_name}' Detail was not updated" unless area_name = area_table[1]
    end

    def verify_area_delete(area)
      area_table = @connection.select_one("select * from district where district = '#{area}'")
      raise "Area '#{area}' Detail was not deleted" unless area_table.nil?
    end

    ##Country##
    def verify_country_create(country, country_name)
      country_table = @connection.select_one("select * from area where area = '#{country}'")
      raise "New Country '#{country_name}' Detail was not created" if country_table.nil?
    end

    def verify_country_edit(country, country_name)
      country_table = @connection.select_one("select * from area where area = '#{country}'")
      raise "Update Country '#{country_name}' Detail was not updated" unless country_name = country_table[1]
    end

    def verify_country_delete(country, country_name)
      country_table = @connection.select_one("select * from area where area = '#{country}'")
      raise "Country '#{country}' Detail was not deleted" unless country_table.nil?
    end

    ##Last Division ID ##
    def last_division_id
      last_division_id = @connection.select_one("Select * from (select chain from chain where chain <> 999 order by chain DESC) WHERE ROWNUM = 1")
      if last_division_id.nil?
        @new_division_id = 1
      else
        @new_division_id = (last_division_id[0] + 1).to_s
      end
    end

    ##Last Country ID ##
    def last_country_id
      last_country_id = @connection.select_one("Select * from (select area from area where area <> 9999 order by area DESC) WHERE ROWNUM = 1")
      if last_country_id.nil?
        @new_country_id = 1
      else
        @new_country_id = (last_country_id[0] + 1).to_s
      end
    end

    ##Last Region ID ##
    def last_region_id
      last_region_id = @connection.select_one("Select * from (select region from region where region <> 9999 and region <> 998 order by region DESC) WHERE ROWNUM = 1")
      if last_region_id.nil?
        @new_region_id = 1
      else
        @new_region_id = (last_region_id[0] + 1).to_s
      end
    end

    ##Last Area ID ##
    def last_area_id
      last_area_id = @connection.select_one("Select * from (select district from district where district <> 9999 order by district DESC) WHERE ROWNUM = 1")
      if last_area_id.nil?
        @new_area_id = 1
      else
        @new_area_id = (last_area_id[0] + 1).to_s
      end
    end


    ##################    STORES   ###################

    ##Last Store ID ##
    def last_store_id
      last_store_id = @connection.select_one("Select * from (select store from store where store <> 99999 and store <> 88888 order by store DESC) WHERE ROWNUM = 1")
      if last_store_id.nil?
        @new_store_id = 1
      else
        @new_store_id = (last_store_id[0] + 2).to_s
      end
    end

    ## Verification for Create and Update Store ##
    def verify_store_create_update(store, store_name)
      store_table = @connection.select_one("select * from store where store = '#{store}'")
      raise "New Store '#{store_name}' Detail was not created" if store_table.nil?
    end

    ## Location Traits ##

    ## Add Location - Verification ##
    def verify_add_location(store)
      store_table = @connection.select_one("select * from loc_traits_matrix where store = '#{store}'")
      raise "New Store '#{store_name}' Detail was not created" if store_table.nil?
    end

    ## Delete Location - Verification ##
    def verify_delete_location(store)
      store_table = @connection.select_one("select * from loc_traits_matrix where store = '#{store}'")
      raise "New Store '#{store_name}' Detail was not created" unless store_table.nil?
    end


    def verify_system_not_creates_new_zone store_name
      zone_table = @connection.select_one("select * from rpm_zone where name = '#{store_name}'")
      raise "New Zone For '#{store_name}' was not created" unless zone_table.nil?
    end


    def verify_system_creates_new_zone store_name
      zone_table = @connection.select_one("select * from rpm_zone where name = '#{store_name}'")
      raise "New Zone For '#{store_name}' was not created" if zone_table.nil?
    end

    ##################    Supplier   ###################

    ### Address ###

    def verify_address_table(func_db_code, supplier_id, type, address_1, city, country, state)
      address_table = @connection.select_one("Select ADD_1, ADDR_TYPE,CITY, STATE, COUNTRY_ID from addr where module = '#{func_db_code}' and key_value_1 = '#{supplier_id}' and country_id = '#{country}'")
      raise "Address is not on the table." if address_table.nil?
      raise "Address 1 is not as Expected:'#{address_1}' Actual:'#{address_table[0]}" unless address_table[0] == address_1.to_s
      raise "Type is not as Expected:'#{type}' Actual:'#{address_table[1]}'" unless address_table[1] == type
      raise "City is not as Expected:'#{city}' Actual:'#{address_table[2]}'" unless address_table[2] == city
      raise "State is not as Expected:'#{state}' Actual:'#{address_table[3]}'" unless address_table[3] == state.to_s
      raise "Country is not as Expected:'#{country}' Actual:'#{address_table[4]}'" unless address_table[4] == country
    end

    def count_address_table(func_db_code, supplier_id, country)
      address_table = @connection.select_one("select count(*) from addr where module = '#{func_db_code}' AND key_value_1 = '#{supplier_id}' and country_id = '#{country}'")
      raise "Address is not on the table." if address_table.nil?
      raise "Address count is not as Expected:'2' Actual:'#{address_table[0]}" unless address_table[0] == '2'.to_i
    end

    def verify_delete_address_table(func_db_code, supplier_id, type, country)
      address_table = @connection.select_one("Select ADD_1, ADDR_TYPE,CITY, STATE, COUNTRY_ID from addr where module = '#{func_db_code}' and key_value_1 = '#{supplier_id}' and ADDR_TYPE = '#{type}' and country_id = '#{country}'")
      raise "Address is not delete." unless address_table.nil?
    end

    ### Partners ###

    def verify_partner_table(partner_id, type, partner_name, status, currency, terms, contact_name, phone)
      partner_table = @connection.select_one("select PARTNER_ID, PARTNER_TYPE,PARTNER_DESC, STATUS, CURRENCY_CODE, TERMS,
                                              CONTACT_NAME, CONTACT_PHONE  from partner where partner_id = '#{partner_id}'")
      raise "Partner is not on the table." if partner_table.nil?
      raise "Partner Type is not as Expected:'#{type}' Actual:'#{partner_table[0]}" unless partner_table[0] == type
      raise "Partner Name is not as Expected:'#{partner_name}' Actual:'#{partner_table[1]}'" unless partner_table[1] == partner_name
      raise "Partner Status is not as Expected:'#{status}' Actual:'#{partner_table[2]}'" unless partner_table[2] == status
      raise "Partner Currency is not as Expected:'#{currency}' Actual:'#{partner_table[3]}'" unless partner_table[3] == currency
      raise "Partner Terms is not as Expected:'#{terms}' Actual:'#{partner_table[4]}'" unless partner_table[4] == terms
      raise "Partner Contact Name is not as Expected:'#{contact_name}' Actual:'#{partner_table[5]}'" unless partner_table[5] == contact_name
      raise "Partner Contact Number is not as Expected:'#{phone}' Actual:'#{partner_table[6]}'" unless partner_table[6] == phone
    end

    ### Inventory Management ###

    def verify_inventory_mgmt_table(supplier_id, type, partner_name, status, currency, terms, contact_name, phone)
      invt_mgmt_table = @connection.select_one("select * from sup_inv_mgmt where supplier = '#{supplier_id}'")
      raise "Inventory Management is not on the table." if invt_mgmt_table.nil?
      raise "Address 1 is not as Expected:'#{address_1}' Actual:'#{invt_mgmt_table[0]}" unless invt_mgmt_table[0] == address_1.to_s
      raise "Type is not as Expected:'#{type}' Actual:'#{invt_mgmt_table[1]}'" unless invt_mgmt_table[1] == type
      raise "City is not as Expected:'#{city}' Actual:'#{invt_mgmt_table[2]}'" unless invt_mgmt_table[2] == city
      raise "State is not as Expected:'#{state}' Actual:'#{invt_mgmt_table[3]}'" unless invt_mgmt_table[3] == state.to_s
      raise "Country is not as Expected:'#{country}' Actual:'#{invt_mgmt_table[4]}'" unless invt_mgmt_table[4] == country.to_i
    end

    ### Supplier Site Traits ###

    def verify_supp_site_traits_table(supplier_id, traits_id)
      supp_site_traits = @connection.select_one("select * from sup_traits_matrix where sup_trait = '#{traits_id}' and supplier = '#{supplier_id}'")
      raise "The Supplier Site id '#{supplier_id}' don't have a supplier trait ." if supp_site_traits.nil?
    end

    def verify_delete_supp_site_traits_table(supplier_id, traits_id)
      supp_site_traits = @connection.select_one("select * from sup_traits_matrix where sup_trait = '#{traits_id}' and supplier = '#{supplier_id}'")
      raise "The Supplier Site id '#{supplier_id}' don't have a supplier trait ." unless supp_site_traits.nil?
    end

    ### Import Attributes ###

    def verify_import_att_table(supp_site_id, func_db_code)
      import_att = @connection.select_one("select * from EXP_PROF_HEAD where module = '#{func_db_code}' and Key_Value_1 = '#{supp_site_id}'")
      raise "The Supplier Site id '#{supp_site_id}' don't have a supplier trait ." if import_att.nil?
    end

    ### Expense ###

    def verify_expense_table(item_id, func_db_code)
      expense_table = @connection.select_one("select * from EXP_PROF_HEAD where module = '#{func_db_code}' and Key_Value_1 = '#{item_id}'")
      raise "The Supplier Site id '#{item_id}' don't have a supplier trait ." if expense_table.nil?
    end

    ### Invoincing Attributes ###

    def verify_invc_att_table(partner_id, invc_receive, invc_pay)
      invc_att = @connection.select_one("    select PARTNER_ID, INVC_RECEIVE_LOC, INVC_PAY_LOC from partner where partner_id = '#{partner_id}'")
      raise "The Partner id '#{partner_id}' don't have Invoincing Attribute ." if invc_att.nil?
      raise "Receive is not as Expected:'#{invc_receive}' Actual:'#{invc_att[1]}'" unless invc_att[1] == invc_receive
      raise "Pay is not as Expected:'#{invc_pay}' Actual:'#{invc_att[2]}'" unless invc_att[2] == invc_pay
    end


    ################## WareHouse ###################

    def last_warehouse_id
      last_warehouse_id = @connection.select_one("Select * from (select wh from wh where wh <> 999999 and wh <> 9999 order by wh DESC) WHERE ROWNUM = 1")
      if last_warehouse_id.nil?
        @new_store_id = 1
      else
        @new_store_id = (last_warehouse_id[0] + 1).to_s
      end
    end

    def verify_warehouse_create_update(warehouse, warehouse_name)
      warehouse_table = @connection.select_one("select * from wh where wh = '#{warehouse}'")
      raise "New Warehouse '#{warehouse_name}' Detail was not created/updated " if warehouse_table.nil?
    end

    def verify_virtual_warehouse_create_update(vwh, vwh_name, physical_wh)
      vwh_table = @connection.select_one("select * from wh where wh = '#{vwh}'")
      raise "New virtual warehouse '#{vwh_name}' Detail was not created" if vwh_table.nil?
      raise "Physical Warehouse '#{physical_wh}' is not assocoated with '#{vwh}'" if physical_wh.to_i != vwh_table[8]
    end

    def verify_warehouse_delete(warehouse, warehouse_name)
      warehouse_table = @connection.select_one("select * from wh where wh = '#{warehouse}'")
      raise " Warehouse '#{warehouse_name}'  was not Delete" unless warehouse_table.nil?
    end


    ## Warehouse - Address Verification ##
    def verify_warehouse_address_table(warehouse_id, address, city, country)
      address_table = @connection.select_one("Select ADD_1,CITY,COUNTRY_ID from addr where module = 'WH' and key_value_1 = '#{warehouse_id}'")

      raise "Address is not on the table." if address_table.nil?
      raise "Address 1 is not as Expected:'#{address}' Actual:'#{address_table[0]}" unless address_table[0] == address.to_s
      raise "City is not as Expected:'#{city}' Actual:'#{address_table[1]}'" unless address_table[1] == city
      raise "Country is not as Expected:'#{country}' Actual:'#{address_table[2]}'" unless address_table[2] == country
    end


    ## Manage WH ; Add - Address(top of existing address) Verification##
    def verify_manage_add_address(warehouse_id, address, city, country)
      address_table = @connection.select_one("Select ADD_1,CITY,COUNTRY_ID from addr where module = 'WH' and key_value_1 = '#{warehouse_id}' and add_1 = #{address}")
      raise "Address is not on the table." if address_table.nil?
      raise "Address 1 is not as Expected:'#{address}' Actual:'#{address_table[0]}" unless address_table[0] == address.to_s
      raise "City is not as Expected:'#{city}' Actual:'#{address_table[1]}'" unless address_table[1] == city
      raise "Country is not as Expected:'#{country}' Actual:'#{address_table[2]}'" unless address_table[2] == country
    end


    ## Delete - Address Verification ##
    def verify_delete_address(warehouse_id, address)
      address_table = @connection.select_one("Select ADD_1 from addr where module = 'WH' and key_value_1 = '#{warehouse_id}' and add_1 = #{address}")
      raise "Address is not Delete from the table." unless address_table.nil?
    end


    ################## Location List ###################

    def verify_location_head_table(location_lis_id, description, comment, static)
      loc_list_head = @connection.select_one("select LOC_LIST_DESC, COMMENT_DESC, STATIC_IND from loc_list_head where loc_list = '#{location_lis_id}'")
      raise "location List id '#{location_lis_id}' not found ." if loc_list_head.nil?
      raise "Description is not as Expected:'#{description}' Actual:'#{loc_list_head[0]}'" unless loc_list_head[0] == description
      raise "Comments is not as Expected:'#{comment}' Actual:'#{loc_list_head[1]}'" unless loc_list_head[1] == comment
      raise "Static is not as Expected:'#{static}' Actual:'#{loc_list_head[2]}'" unless loc_list_head[2] == static
    end

    def verify_location_details_table(location_lis_id, location, type)
      loc_list_detail = @connection.select_one("select * from loc_list_detail where loc_list = '#{location_lis_id}'")
      raise "The Locations for Location List id '#{location_lis_id}' Not found." if loc_list_detail.nil?
      raise "Location is not as Expected:'#{location}' Actual:'#{loc_list_detail[1]}'" unless loc_list_detail[1] == location
      raise "Type is not as Expected:'#{type}' Actual:'#{loc_list_detail[2]}'" unless loc_list_detail[2] == type
    end

    def verify_delete_location_head_table(location_lis_id, description, comment, static)
      loc_list_head = @connection.select_one("select LOC_LIST_DESC, COMMENT_DESC, STATIC_IND from loc_list_head where loc_list = '#{location_lis_id}'")
      raise "Location List is not delete." unless loc_list_head.nil?
    end

    def verify_delete_location_details_table(location_lis_id, location, type)
      loc_list_detail = @connection.select_one("select * from loc_list_detail where loc_list = '#{location_lis_id}'")
      raise "Location is not delete." unless loc_list_detail.nil?
    end

    #############################################################################
    ###########################BWS - Verifications###############################
    #############################################################################

    def verify_subdept_category(sub_dept, category)
      category_details = @connection.select_one("select  * from class where dept = '#{sub_dept}' and class = #{category} ")
      raise "The Category #{category} doesnot match with the sub depertment #{sub_dept}." if category_details.nil?
    end

  end
end

