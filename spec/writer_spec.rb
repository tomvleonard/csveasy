require 'spec_helper'
require 'csveasy/writer'

describe Writer do

  before do
    @data = [ [ 'header1', 'header2' ], [ 'value1', 'value2' ] ]
  end

  describe '#initialize' do

    before do
      @filepath = 'some/filepath'
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

    before do 
      @filepath = 'some/filepath'
      @writer = Writer.new(@filepath, @data)
    end

    it 'calls .open on CSV class' do
      CSV.should_receive(:open).with(@filepath, 'wb')
      @writer.write
    end

    it 'calls #valid_data? on self' do
      CSV.stub(:open)
      @writer.should_receive(:valid_data?).and_return(true)
      @writer.write
    end

    it 'raises error if #valid_data? call returns false' do
      CSV.stub(:open)
      @writer.should_receive(:valid_data?).and_return(false)
      expect { @writer.write }.to raise_error(RuntimeError, /Data is invalid./)
    end

    it 'calls #convert_hashes_to_arrays on self' do
      CSV.stub(:open)
      @writer.should_receive(:convert_hashes_to_arrays).and_return([])
      @writer.write
    end

  end

  describe '#valid_data?' do

    before do 
      @writer = Writer.new('', [])
    end
   
    it 'returns true if @data is an array of arrays' do
      @writer.should_receive(:array_of?).with(Array).and_return(true)
      @writer.send(:valid_data?).should be_true
    end

    it 'returns true if @data is an array of hashes' do
      @writer.should_receive(:array_of?).with(Array).and_return(false)
      @writer.should_receive(:array_of?).with(Hash).and_return(true)
      @writer.send(:valid_data?).should be_true
    end

    it 'returns false if @data is neither an array of arrays nor hashes' do
      @writer.send(:valid_data?).should be_false
    end

  end

  describe '#convert_hashes_to_arrays' do

    context 'when @data is an array of hashes' do

      it 'converts it into a CSV-consumable array of arrays' do
        data = [ { 'first_name' => 'Barney', 'last_name' => 'Rubble' } ]
        expected = [ [ 'first_name', 'last_name' ], [ 'Barney', 'Rubble' ] ]
        writer = Writer.new('some/filepath', data)
        writer.send(:convert_hashes_to_arrays)

        writer.instance_variable_get(:@data).should eql(expected)
      end

    end

    context 'when @data is an array of arrays' do

      it 'does not modify @data' do
        data = [ [ 'first_name', 'last_name' ], [ 'Barney', 'Rubble' ] ]
        data.should_not_receive(:inject)
        writer = Writer.new('some/filepath', data)
        writer.send(:convert_hashes_to_arrays)
      end

    end

  end

  describe '#array_of?' do

    shared_examples_for 'returns false' do

      it '@data is not an array' do
        data = 'string'
        writer = Writer.new('', data)

        writer.send(:array_of?, @klass).should be_false
      end

      it '@data array contains invalid items' do
        data = [ 'string' ]
        writer = Writer.new('', data)

        writer.send(:array_of?, @klass).should be_false
      end

    end

    context 'when argument is Array' do

      before do
        @klass = Array
      end

      it 'returns true' do
        data = [ [ ] ]
        writer = Writer.new('', data) 
      end

      it_should_behave_like 'returns false'
    end

    context 'when argument is Hash' do

      before do
        @klass = Array
      end

      it 'returns true' do
        data = [ { } ]
        writer = Writer.new('', data) 
      end

      it_should_behave_like 'returns false'

    end

  end

end
