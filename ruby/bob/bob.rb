class Bob

  def hey(received_message)
    message = Message.new(received_message)

    if message.silent?
      "Fine. Be that way!"
    elsif message.bro?
      LeetSpeak.new(received_message).l33t
    elsif message.shouting?
      "Woah, chill out!"
    elsif message.question?
      "Sure."
    else
      "Whatever."
    end
  end

end

class Message

  def initialize(phrase)
    @phrase = phrase
  end

  def silent?
    @phrase.strip.empty?
  end

  def shouting?
    @phrase.upcase == @phrase
  end

  def question?
    @phrase.end_with?("?")
  end

  def bro?
    @phrase.start_with?("Bro, ")
  end

end

class LeetSpeak

  attr_reader :l33t
  
  def initialize(message)
    @l33t = convert_message(message)
  end

  def vowels_cypher
    {"a" => "4", "e" => 3, "i" => 1, "o" => 0, "u" => "u", "y" => "y"}
  end

  def convert_message(message)
    message = remove_greeting(message)
    message = check_for_consonants_in_message(message)
    message = check_for_vowels_in_message(message)
  end

  def remove_greeting(message)
    message.slice!(0..4)
    message
  end

  def check_for_consonants_in_message(message)
    words = message.split(" ")
    message = words.collect do |word|
      word = check_for_consonants_in_word(word)
    end
    message.join(" ")
  end

  def check_for_consonants_in_word(word)
    chars = word.split('')
    new_parts = []
    lowercase = false
    chars.each_with_index do |char, index|
      if index == 0
        new_parts << char.downcase!
      elsif (!vowels_cypher.keys.include?(chars[index-1].downcase) && index != 0)
        if lowercase
          new_parts << char.downcase!
          lowercase = false
        else
          new_parts << char.upcase!
          lowercase = true
        end
      else
        new_parts << char.downcase!
        lowercase = false
      end
    end
    chars.join
  end

  def check_for_vowels_in_message(message)
    message_characters = message.split('')
    converted_message  = message_characters.collect do |char|
      if vowels_cypher.keys.include?(char.downcase)
        vowels_cypher[char.downcase] 
      else
        char
      end
    end
    converted_message.join
  end

end
