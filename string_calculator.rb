require 'test/unit'
class StringCalculator
  def add(numbers)
    numbers.to_i
  end
end

class TestStringCalculator < Test::Unit::TestCase
  def setup
    @calculator = StringCalculator.new
  end

  def test_empty_string
    assert_equal(0, @calculator.add(''))
  end

  def test_single_number_string
    assert_equal(1, @calculator.add("1"))
  end
end  