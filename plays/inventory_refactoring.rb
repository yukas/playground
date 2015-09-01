require "csv"

# class Inventory
#   def import_products(file_path)
#     CSV.read(file_path, :headers => true).each do |row|
#     if row.field("name").present?
#       # do something interesting
#     end
#   end
# end

class Client
  def import
    importer = CsvProductImporter.new(params[:file_path])
    inventory = Inventory.new(importer)
    
    inventory.import_products
  end
end

class Inventory
  attr_reader :importer
  
  def initialize(importer)
    @importer = importer
  end
  
  def import_products
    valid_products.each do |product|
      # do the work
    end
  end
  
  private
  
  def valid_products
    @valid_products ||= begin
      importer.import_products
      importer.valid_products
    end
  end
end

class CsvProductImporter
  attr_reader :file_path
  attr_reader :valid_products
  
  def initialize(file_path)
    @file_path = file_path
    @valid_products = []
  end
  
  def import_products
    CSV.read(file_path, headers: true).each do |row|
      @valid_products << row if valid_row?(row)
    end
  end
  
  private
  
  def valid_row?(row)
    row.field("name").present?
  end
end