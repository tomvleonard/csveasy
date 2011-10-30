require 'csv'

class Writer

  def initialize(filepath, data)
    @filepath = filepath
    @data = data
  end

  def write
    raise 'Data is invalid.' and return unless valid_data?
    convert_hashes_to_arrays
    CSV.open(@filepath, 'wb') do |file|
      @data.each { |row| file << row }
    end
  end

  private

    def valid_data?
      array_of?(Array) || array_of?(Hash) 
    end

    def convert_hashes_to_arrays
      if array_of?(Hash)
        @data = @data.inject([]) { |array, hash| array << hash.values }.insert(0, @data[0].keys)
      end
    end

    def array_of?(klass)
      @data.instance_of?(Array) && @data[0].instance_of?(klass)
    end

end
