require 'rubygems'
require 'bundler/setup'

require 'geo_file'
require 'excel'
require 'excelx'
require 'geo_transformer'

module GeoConverter

  def self.parse(file)
    if file.respond_to?(:read)
      if klass = GeoConverter.const_get(type(file))
        klass.new file.path
      end
    end
  end

  def self.parse_gauss_krueger(gk_string)
    rechts, hoch = gk_string.split(",")
    GausKrueger.new(rechts, hoch)
  end
  def self.type(file)
    self.send(File.extname(file).gsub(".",""))
  end

  def self.xlsx
    "Excelx"
  end

  def self.xls
    "Excel"
  end

  def csv
    CSV
  end
end

#p GeoConverter.parse(File.open("windraeder.xlsx")).transform_gauss_krueger("Rechtswert","Hochwert").write_csv
