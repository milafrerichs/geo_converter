require 'csv'
require 'roo'
require 'roo-xls'

module GeoConverter
  class Excel < GeoFile

    def headers
      @rows.headers
    end

    def rows
      @rows ||= ::CSV.parse(csv,@options)
    end

    def csv
      @csv ||= xls_file.to_csv
    end

    def xls_file
      @xls_file ||= ::Roo::Excel.new(@filename)
    end
  end
end
