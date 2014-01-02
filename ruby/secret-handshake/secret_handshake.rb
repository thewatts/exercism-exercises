require 'pry'

class SecretHandshake
  attr_reader :binary

  def initialize(input)
    if input.kind_of?(Fixnum)
      @binary = input.to_s(2).reverse
    else
      @binary = ""
    end
  end

  def commands
    data = binary[0..3]
    negative = binary[4]
    results = []

    data.chars.each_with_index do |digit, index|
      #binding.pry
      if digit == "1"
        key = digit + "0"*index
        results << known_digits[key]
      end
    end

    if negative
      results.reverse
    else
      results
    end
  end

  def known_digits
    {
      "1"    => "wink",
      "10"   => "double blink",
      "100"  => "close your eyes",
      "1000" => "jump"
    }
  end

end
