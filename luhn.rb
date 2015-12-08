class Luhn
  attr_reader :number, :alter_digit, :original_array

  def initialize(number)
    @number = number
    @alter_digit = false
    @original_array = []
  end

  def convert_number_to_array
    arr = []
    number.to_s.chars.each { |n| arr << n.to_i }
    @original_array = arr
  end

  def alternate_state
    if alter_digit = true
      @alter_digit = false
    else
      @alter_digit = true
    end
  end

  def convert_digit(digit)
    coverted_digit = nil
    if digit * 2 > 9
      coverted_digit = digit * 2 - 9
    else
      converted_digit = digit * 2
    end
    converted_digit
  end


  def addends
    convert_number_to_array
    add_ends_array = []
    until original_array.size == 0
      if @alter_digit == true
        add_ends_array << convert_digit(original_array.last)
        original_array.pop
      else
        add_ends_array << original_array.pop
      end
      alternate_state
    end
    add_ends_array.reverse!
  end

  def checksum
  end

  def valid?
  end
end