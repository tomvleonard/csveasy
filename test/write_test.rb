require './test/helper'
require 'mocha'

class WriteTest < Test::Unit::TestCase

  def test_write
    filepath = 'some/filepath'
    data = [ [ 'one', 'two' ], [ '1', '2' ] ]
    CSV.expects(:open).with(filepath, 'wb')
    Csveasy.write(filepath, data)
  end

end
