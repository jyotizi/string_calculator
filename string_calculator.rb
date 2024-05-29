require 'test/unit'
class StringCalculator
  def add(numbers)
  end
end

class TestStringCalculator < Test::Unit::TestCase
  def setup
    @calculator = StringCalculator.new
  end

  def test_empty_string
    assert_equal(0, @calculator.add(''))
  end
end  