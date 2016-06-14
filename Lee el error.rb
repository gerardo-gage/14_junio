#Lee el error 
def dummy_encrypt(string)
    word_reverse = string.reverse
    swapped_word = word_reverse.swapcase
    encrypted_word = swapped_word.gsub(/[aeio]/,"*")

    return encrypted_word
end