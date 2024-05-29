require 'test/unit'
class StringCalculator
  def add(numbers)
  end
end

class TestStringCalculator < Test::Unit::TestCase
  def setup
    @calculator = StringCalculator.new
  end
end  