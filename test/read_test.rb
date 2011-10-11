require './test/helper'
require './lib/csveasy/reader'

class ReadTest < Test::Unit::TestCase

  include Reader

  def test_true
    assert true
  end

  def test_read
    read('filename')
  end

end
