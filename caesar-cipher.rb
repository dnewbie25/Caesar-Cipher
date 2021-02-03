# This program will ask in loop if you want to cipher/decipher a sentence
# You can choose the number of shifts you want to apply and quit the program at the end

def cipher(sentence, shift)
  # Funtion to cipher the word given a specific shift value to change the letter
  lowercase = 'abcdefghijklmnopqrstuvwxyz'
  uppercase = lowercase.upcase

  ciphered_word = []

  sentence.each_char.with_index do |char, idx|

    if lowercase.include?(char)
      index = lowercase.index(char)
      ciphered_word << lowercase[(index + shift) % 26]
    elsif uppercase.include?(char)
      index = uppercase.index(char)
      ciphered_word << uppercase[(index + shift) % 26]
    else
      ciphered_word << char
    end
  end

  return ciphered_word.join('')

end

def decipher(sentence, shift)
  # Function to decipher the sentence, it acts in the opposite way to cipher()
  lowercase = 'abcdefghijklmnopqrstuvwxyz'
  uppercase = lowercase.upcase

  deciphered_word = []

  sentence.each_char.with_index do |char, idx|

    if lowercase.include?(char)
      index = lowercase.index(char)
      deciphered_word << lowercase[(index - shift) % 26]
    elsif uppercase.include?(char)
      index = uppercase.index(char)
      deciphered_word << uppercase[(index - shift) % 26]
    else
      deciphered_word << char
    end
  end

  return deciphered_word.join('')
end

# Loop to ask user 

while continue
  puts "Do you want to use Caesar Ciper? Y/N"
  option = gets.chomp.downcase 

  if option == 'n'
    puts "Okay, good bye!"
    continue = false
    break
  end

  puts "Enter the phrase you want to cipher or decipher: "
  input = gets.chomp
  puts "Enter 'C' to cipher or 'D' to decipher: "
  choice = gets.chomp.downcase

  if choice == 'c'
    puts "Enter the times you want to shift the letter: "
    number = gets.chomp.to_i
    puts cipher(input, number)
  elsif choice == 'd'
    puts "Enter the times you want to shift the letter: "
    number = gets.chomp.to_i
    puts decipher(input, number)
  else
    puts "Invalid option"
  end

end



