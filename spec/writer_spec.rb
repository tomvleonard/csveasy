require 'spec_helper'
require 'csveasy/writer'

describe Writer do

  describe '#initialize' do

    before do
      @filepath = 'some/filepath'
      @data = []
      @writer = Writer.new(@filepath, @data)
    end

    it 'sets instance variable @filepath' do
      @writer.instance_variable_get(:@filepath).should eql(@filepath)
    end

    it 'sets instance variable @data' do
      @writer.instance_variable_get(:@data).should eql(@data)
    end

  end

  describe '#write' do

    it 'calls .open on CSV class' do
      filepath = 'some/filepath'
      CSV.should_receive(:open).with(filepath, 'wb')
      writer = Writer.new(filepath, [])
      writer.write
    end

  end

end
