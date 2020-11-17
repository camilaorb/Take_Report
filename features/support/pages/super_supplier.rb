require 'test-evolve/core/page_object'

module Pages
  def super_supplier
    @super_supplier ||= SuperSupplier.new
  end

  class SuperSupplier < TestEvolve::Core::PageObject

    ################################ Objects #############################

    def reopen_address
      supplier.open_supplier
      supplier.search_supplier(YML_DATA['supplier_id'])
      supplier.select_supplier(YML_DATA['supplier_id'])
      supplier.select_supplier_site('')
      supplier.access_supplier
      supplier.access_address
      supplier.close_supplier
    end






  end
end


