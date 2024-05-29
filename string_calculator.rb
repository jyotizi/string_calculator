require 'test/unit'
class StringCalculator
  def add(numbers)
    numbers.split(',').map(&:to_i).sum
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

  def test_multiple_numbers_string
    assert_equal(6, @calculator.add("1,5"))
  end
end  