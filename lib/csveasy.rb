require 'csveasy/version'
require 'csveasy/reader'
require 'csveasy/writer'

module Csveasy

  def self.read(filepath)
    reader = Reader.new(filepath)
    reader.read 
  end

  def self.write(filepath, data)
     writer = Writer.new(filepath, data)
     writer.write
  end

end
