require 'test-evolve/core/page_object'
require 'open-uri'
require 'dbi'

module Pages
  def database
    @database ||= Database.new
  end

  class Database < TestEvolve::Core::PageObject

  ############################ Methods ###########################

  def connect_to_db(db_hostname, db_port, db_servicename, db_username, db_password)
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


  ############### Verify Last Id ######################

  ##### Merchandise Hierarchy #####

  def division_id
    last_id = @connection.select_one("Select * from (select DIVISION from DIVISION order by DIVISION DESC) WHERE ROWNUM = 1")
    if last_id.nil?
      @new_id = 1
    else
      @new_id = (last_id[0]+ 1).to_s
    end
  end

  def department_id
    last_id = @connection.select_one("Select * from (select GROUP_NO from GROUPS order by GROUP_NO DESC) WHERE ROWNUM = 1")
    if last_id.nil?
      @new_id = 1
    else
      @new_id = (last_id[0]+ 1).to_s
    end
  end

  def category_id(subdept_id)
    last_id = @connection.select_one("Select * from (select CLASS from CLASS WHERE DEPT = (#{subdept_id}) order by CLASS DESC) WHERE ROWNUM = 1")
    if last_id.nil?
      @new_id = 1
    else
      @new_id = (last_id[0]+ 1).to_s
    end
  end

  def subcategory_id(subdept_id, category_id)
    last_id  = @connection.select_one("Select *from (select SUBCLASS from SUBCLASS WHERE DEPT = (#{subdept_id}) AND CLASS = (#{category_id}) order by SUBCLASS DESC) WHERE ROWNUM = 1")
    if last_id.nil?
      @new_id = 1
    else
      @new_id = (last_id[0]+ 1).to_s
    end
  end

  def subdpt_id
    last_id  = @connection.select_one("Select * from (select DEPT from DEPS order by DEPT DESC) WHERE ROWNUM = 1")
    if last_id.nil?
      @new_id = 1
    else
      @new_id = (last_id[0]+ 1).to_s
    end
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

  def group_detail_id(diff_group_id)
    last_id  = @connection.select_one("Select * from (select DISPLAY_SEQ from DIFF_GROUP_DETAIL WHERE DIFF_GROUP_ID = (#{diff_group_id}) order by DISPLAY_SEQ DESC) WHERE ROWNUM = 1")
    if last_id.nil?
      @new_id = 1
    else
      @new_id = (last_id[0].to_i) + 1
    end
  end

  def diff_range_id
    last_id  = @connection.select_one("Select * from (select DIFF_RANGE from DIFF_RANGE_HEAD order by DIFF_RANGE DESC) WHERE ROWNUM = 1")
    if last_id.nil?
      @new_id = 1
    else
      @new_id = (last_id[0].to_i) + 1
    end
  end

  ############### Verify Data ######################


  ### Merchandise Hierarchy ###

  def verify_division_table(div_id, division_name, buyer, merchandiser )
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

  def verify_subcategory_table(subcategory_id, subdept_id, category_id, subcategory_name)
    new_subcategory = @connection.select_one("Select * from SUBCLASS WHERE DEPT = (#{subdept_id}) AND CLASS = (#{category_id}) AND SUBCLASS = (#{subcategory_id})")
    raise "Subcategory no '#{subcategory_id}' was not created" if new_subcategory.nil?
    raise "Name is wrong. Expected:'#{subcategory_name}' Actual:'#{new_subcategory[3]}'" unless new_subcategory[3] == subcategory_name
  end

  def verify_subsubdept_table(subdept_id, subdept_name, buyer, merch, profit_calc, purchase, dept, mark_retail,mark_cost,
                              total_market_amount, markup_calc, otb_calc,maximum_average, average_tolerance)
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
    new_merch_hier = @connection.select_one("Select * from MERCH_HIER_DEFAULT where DEPT = (#{subdept_id})")
    raise "Merchandise Hierarchy Default info '#{info}' related to sub-department no '#{subdept_id}' was not created" if new_merch_hier.nil?
    raise "Info is wrong. Expected:'#{info}' Actual:'#{new_merch_hier[3]}'" unless new_merch_hier[3] == info
    raise "Category is wrong. Expected:'#{category}' Actual:'#{new_merch_hier[5]}'" unless new_merch_hier[5] == category
    raise "Subcategory is wrong. Expected:'#{subcategory}' Actual:'#{new_merch_hier[6]}'" unless new_merch_hier[6] == subcategory
    raise "Require is wrong. Expected:'#{required}' Actual:'#{new_merch_hier[8]}'" unless new_merch_hier[8] == required
  end

  #### Diffs ###

  def verify_diff_group_table(new_diff_group_id, group_name, type )
    new_diff_group = @connection.select_one("Select  DIFF_TYPE , DIFF_GROUP_DESC from DIFF_GROUP_HEAD WHERE DIFF_GROUP_ID = #{new_diff_group_id}")
    raise "Diff Group no '#{new_diff_group_id}' was not created" if new_diff_group.nil?
    raise "Group Description is wrong. Expected:'#{group_name}' Actual:'#{new_diff_group[1]}'" unless new_diff_group[1] == group_name
    raise "Type is wrong. Expected:'#{type}' Actual:'#{new_diff_group[0]}'" unless new_diff_group[0] == type
  end

  def verify_delete_diff_group_table(diff_group_id)
    diff_group = @connection.select_one("Select * from DIFF_GROUP_HEAD WHERE DIFF_GROUP_ID = #{diff_group_id}")
    raise "The Diff Group no '#{diff_group_id}' was not deleted" unless diff_group.nil?
  end

  def verify_diff_group_detail_table(diff_group_detail_id, diff, sequence )
    diff_group_detail = @connection.select_one("Select DIFF_GROUP_ID, DIFF_ID, DISPLAY_SEQ from DIFF_GROUP_DETAIL WHERE DIFF_GROUP_ID = #{diff_group_detail_id}")
    raise "New Diff Group Detail no '#{diff_group_detail_id}' was not created" if diff_group_detail.nil?
    raise "Sequence is wrong. Expected:'#{diff}' Actual:'#{diff_group_detail[2]}'" unless diff_group_detail[1] == diff
    raise "Sequence is wrong. Expected:'#{sequence}' Actual:'#{diff_group_detail[4]}'" unless diff_group_detail[2] == sequence.to_i
  end

  def verify_delete_diff_group_detail_table(diff_group_detail_id, sequence)
    diff_group_detail = @connection.select_one("Select * from DIFF_GROUP_DETAIL WHERE DIFF_GROUP_ID = #{diff_group_detail_id} AND DISPLAY_SEQ = #{sequence}")
    raise "New Diff Group Detail no '#{diff_group_detail_id}' was not deleted" unless diff_group_detail.nil?
  end

  def verify_diff_range_header_table(diff_range_id, diff_range_desc, diff_group_1, diff_group_2, diff_group_3, diff_range_type)
    diff_range_head = @connection.select_one("Select * from DIFF_RANGE_HEAD where DIFF_RANGE = #{diff_range_id}")
    raise "New Diff Range no '#{diff_range_id}' was not created" if diff_range_head.nil?
    raise "Diff Range Description is wrong. Expected:'#{diff_range_desc}' Actual:'#{diff_range_head[1]}'" unless diff_range_head[1] == diff_range_desc
    raise "Diff Group 1 is wrong. Expected:'#{diff_group_1}' Actual:'#{diff_range_head[2]}'" unless diff_range_head[2] == diff_group_1
    raise "Diff Group 2 is wrong. Expected:'#{diff_group_2}' Actual:'#{diff_range_head[3]}'" unless diff_range_head[3] == diff_group_2
    raise "Diff Group 3 is wrong. Expected:'#{diff_group_3}' Actual:'#{diff_range_head[4]}'" unless diff_range_head[4] == diff_group_3
    raise "Diff Range Type is wrong. Expected:'#{diff_range_type}' Actual:'#{diff_range_head[5]}'" unless diff_range_head[5] == diff_range_type
  end

  def verify_diff_range_detail_table(diff_range_id, colour,compatibility, flavour, ratio, sequence )
    diff_range_head = @connection.select_one("Select * from  DIFF_RANGE_DETAIL where DIFF_RANGE = #{diff_range_id} and seq_no =#{sequence}")
    raise "New Diff Range Detail no '#{diff_range_id}' was not created" if diff_range_head.nil?
    raise "Colour is wrong. Expected:'#{colour}' Actual:'#{diff_range_head[2]}'" unless diff_range_head[2] == colour
    raise "Compatibility is wrong. Expected:'#{compatibility}' Actual:'#{diff_range_head[3]}'" unless diff_range_head[3] == compatibility
    raise "Flavour is wrong. Expected:'#{flavour}' Actual:'#{diff_range_head[4]}'" unless diff_range_head[4] == flavour
    raise "Ratio is wrong. Expected:'#{ratio}' Actual:'#{diff_range_head[5]}'" unless diff_range_head[5] == ratio.to_i
  end

  def verify_delete_diff_range_detail_table(diff_group_detail_id)
    diff_group_detail = @connection.select_one("Select * from DIFF_GROUP_DETAIL WHERE DIFF_GROUP_ID = #{diff_group_detail_id}")
    raise "New Diff Group Detail no '#{diff_group_detail_id}' was not deleted" unless diff_group_detail.nil?
  end

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







  end
end

