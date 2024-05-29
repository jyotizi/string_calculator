require 'test/unit'
class StringCalculator
  def add(numbers)
    separator , new_numbers = *numbers.scan(%r{^//(.+)\n(.*)}).flatten
    number_array =
      if separator && new_numbers
        new_numbers.split(Regexp.union(["\n", separator]))
      else
        numbers.split(Regexp.union(["\n", ","]))
      end
    number_array.map(&:to_i).sum
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

  def test_newline_separator
    assert_equal(6, @calculator.add("1\n2,3"))
    assert_equal(6, @calculator.add("1,2\n3"))
    assert_equal(6, @calculator.add("1\n2\n3"))
  end

  def test_custom_separator
    assert_equal(3, @calculator.add("//;\n1;2"))
  end

  def test_negative_numbers
    exception = assert_raise(RuntimeError) { @calculator.add("-1,-2,3") }
    assert_equal("negative numbers not allowed -1", exception.message)

    exception = assert_raise(RuntimeError) { @calculator.add("1,-2,3") }
    assert_equal("negative numbers not allowed -2", exception.message)
  end
end  