require './test/helper'
require './lib/csveasy/writer'

class WriteTest < Test::Unit::TestCase

  include Writer

  def test_write
    write('filename', ['data'])
  end

end
