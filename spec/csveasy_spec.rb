require 'spec_helper'
require 'csveasy'

describe Csveasy do

  describe '#read' do

    it 'calls #read on Reader instantiation' do
      filepath = 'some/filepath'
      reader = mock(:reader)
      reader.should_receive(:read)
      Reader.should_receive(:new).with(filepath).and_return(reader)
      Csveasy.read(filepath)
    end

    describe 'return value' do

      before do
        @result = Csveasy.read('spec/files/test.csv')
      end

      it 'returns an array' do
        @result.should be_instance_of(Array)
      end

      it 'contains an array of hashes' do
        @result[0].should be_instance_of(Hash)
      end

      describe 'array hashes' do

        it 'have the expected keys' do
          @result[0].keys.should == %w(first_name middle_name last_name)
        end

        it 'have expected values' do
          @result[0].values.should == %w(Fred Sonic Smith)
        end

        it 'have keys that are strings' do
          @result[0].keys.each do |key|
            key.should be_instance_of(String)
          end

        end

      end

    end

  end

  describe '#write' do

    it 'calls #write on Writer instantiation' do
      filepath = 'some/filepath'
      data = [ ['some', 'data'] ]
      writer = mock(:writer)
      writer.should_receive(:write)
      Writer.should_receive(:new).with(filepath, data).and_return(writer)

      Csveasy.write(filepath, data)
    end

  end

end
