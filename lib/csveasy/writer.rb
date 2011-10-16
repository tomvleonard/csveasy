require 'csv'

class Writer

  def initialize(filepath, data)
    @filepath = filepath
    @data = data
  end

  def write
    CSV.open(@filepath, 'wb') do |file|
      @data.each { |row| file << row }
    end
  end

end
