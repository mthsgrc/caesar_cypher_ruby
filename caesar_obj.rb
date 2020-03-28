class Caesar
  attr_reader :word

  def initialize(word, pass)
    @word = word
    @pass = pass
  end

  def str_to_encrypt
    downcase = Array("a".."z")
    upcase = Array("A".."Z")

    to_encrypt_array = @word.split("")
    encrypted = []
    to_encrypt_array.each do |letter|

      if downcase.include?(letter)
        case downcase.index(letter) + @pass
        when 0..25 then new_letter = downcase.index(letter) + @pass
          encrypted.push(downcase[new_letter])
        else new_letter = (downcase.index(letter) + @pass) - 26
          encrypted.push(downcase[new_letter])
        end
      elsif upcase.include?(letter)
        case upcase.index(letter) + @pass
        when 0..25 then new_letter = upcase.index(letter) + @pass
          encrypted.push(upcase[new_letter])
        else new_letter = (upcase.index(letter) + @pass) - 26
          encrypted.push(upcase[new_letter])
        end
      else
        encrypted.push(letter)
      end
    end
    
    @word = encrypted.join("")
    # p encrypted

  end
end

sentence = Caesar.new("What a string!", 5)
sentence.str_to_encrypt
p sentence.word
