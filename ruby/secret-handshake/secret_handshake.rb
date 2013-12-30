class SecretHandshake
  attr_reader :pointer

  def initialize(input)
    @pointer = input
  end

  def commands
    # 1. Take the decimal and convert it to binary string
    # 2. Starting from the right, go through each digit
    # 3. If it is a "1" then add this element to the commands
    #
    # 3 becomes "11"
    # Take the rightmost "1" and look it up as "wink"
    # Take the other "1" and look it up as "double blink"
    #

    binary = pointer.to_s(2)
    data = binary[0..3]
    negative = binary[4]
    results = []

    data.chars.reverse.each.with_index do |digit, index|
      if digit == "1"
        key = digit << "0"*index
        results << known_digits[key]
      end
    end

    if negative == "1"
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
