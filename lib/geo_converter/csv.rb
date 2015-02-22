module GeoConverter

  class CSV
    def initialize(file)
      @filename = file
      @options = options
    end

    def parse
      @csv = CSV.parse(@filename, @options)
    end

    def write_csv(basename)
    end
  end
end
