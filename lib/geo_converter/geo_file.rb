module GeoConverter
  class GeoFile
    def initialize(file, options={ headers: true })
      @filename = file
      @options = options
    end
    def basename
      @basename ||= File.basename(@filename)
    end

    def write_csv
      CSV.open("#{basename}.csv", "wb") do |csv|
        csv << headers
        @rows.each do |row|
          csv << row
        end
      end
    end

    def latitude_column
      "latitude"
    end

    def longitude_column
      "longitude"
    end

    def rows
      @rows ||= []
    end

    def transform_gauss_krueger(right_column, height_column)
      rows.map do |row|
        gauss_krueger = GeoTransformer::GausKrueger.new(row[right_column], row[height_column])
        row[latitude_column] = gauss_krueger.latitude
        row[longitude_column] = gauss_krueger.longitude
      end
      self
    end
  end
end
