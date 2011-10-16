require './test/helper'

class ReadTest < Test::Unit::TestCase

  def test_read_returns_an_array
    assert result.instance_of?(Array), 'The read method should return an array'
  end

  def test_array_contains_hashes
    assert result[0].instance_of?(Hash), 'The array should contain hashes'
  end

  def test_hash_keys
    assert result[0].keys == %w(first_name middle_name last_name), 'The hash should have the expected keys'
  end

  def test_hash_values_in_first_row
    assert result[0].values == %w(Fred Sonic Smith), 'The first hash should have the expected values'
  end

  def test_hash_keys_are_strings
    assert result[0]['middle_name'] == 'Sonic', 'Hash keys should be strings'
  end

  def test_hash_values_in_last_row
    assert result[1].values == %w(Arthur Two\ Sheds Jackson), 'The last hash should have the expected values'
  end

  def result
    @result ||= Csveasy.read('test/files/test.csv')
  end

end
