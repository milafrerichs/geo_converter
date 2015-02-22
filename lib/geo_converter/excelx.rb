require 'csv'
require 'roo'
require 'roo-xls'

module GeoConverter
  class Excelx < Excel

    def xls_file
      @xls_file ||= ::Roo::Excelx.new(@filename)
    end
  end
end
