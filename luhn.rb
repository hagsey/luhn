class Luhn
  attr_reader :number, :alter_digit, :original_array

  def initialize(number)
    @number = number
    @alter_digit = false
    @original_array = convert_number_to_array
  end

  def convert_number_to_array
    array = []
    number.to_s.chars.each { |n| array << n.to_i }
    @original_array = array
  end

  def alternate_digit
    if @alter_digit == true
      @alter_digit = false
    else
      @alter_digit = true
    end
  end

  def convert_digit(digit)
    converted_digit = nil
    if digit * 2 > 9
      coverted_digit = digit * 2 - 9
    else
      converted_digit = digit * 2
    end
  end


  def addends
    add_ends_array = []
    until original_array.size == 0
      if @alter_digit == true
        modified_digit = convert_digit(original_array.last)
        add_ends_array.unshift(modified_digit)
      else
        add_ends_array.unshift(original_array.last)
      end
      original_array.pop
      alternate_digit
    end
    add_ends_array
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    Luhn.new(number)
    if number.valid?
      number
    else
      # iterate through 0..9, 
      # appending each one to number and 
      # checking the new number if valid
      #return new number
      valid_number = ""
      (0..9).each do |num|
        original_array << num
        if valid?
          valid_number = add_ends_array.join('').to_i
        else
        end
      end
    end
  end
end