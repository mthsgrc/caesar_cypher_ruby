def str_to_encrypt(word, pass)
  downcase = Array("a".."z")
  upcase = Array("A".."Z")

  if pass > 26
    pass = pass % 26
  end

  to_encrypt_array = word.split("")
  encrypted = []
  to_encrypt_array.each do |letter|

    if downcase.include?(letter)
      case downcase.index(letter) + pass
      when 0..25 then new_letter = downcase.index(letter) + pass
        encrypted.push(downcase[new_letter])
      else new_letter = (downcase.index(letter) + pass) - 26
        encrypted.push(downcase[new_letter])
      end
    elsif upcase.include?(letter)
      case upcase.index(letter) + pass
      when 0..25 then new_letter = upcase.index(letter) + pass
        encrypted.push(upcase[new_letter])
      else new_letter = (upcase.index(letter) + pass) - 26
        encrypted.push(upcase[new_letter])
      end
    else
      encrypted.push(letter)
    end
  end

  encrypted = encrypted.join("")
  puts encrypted

end

puts "Insert your word to cypher: "
user_word = gets.chomp
user_word.to_s

puts "Insert a Integer for cypher: "
user_cypher = gets.chomp

while user_cypher.to_i <= 0
  puts "Insert a Integer for cypher: "
  user_cypher = gets.chomp
end

user_word = user_word.to_s
user_cypher = user_cypher.to_i

str_to_encrypt(user_word, user_cypher)
