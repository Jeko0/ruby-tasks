class Caesar
  UPPERCASE_LETTERS = ("A".."Z").to_a 
  LOWERCASE_LETTERS = ("a".."z").to_a 
  ALPHABET_SIZE = 26

  attr_accessor :key 

  def initialize(encrypted, key)
    @encrypted = encrypted
    @key = key 
  end

  def call 
    input_validation 
    encrypt_text
  rescue ArgumentError => e  
    warn e 
  end 

  private 

  def encrypt_text
    encrypted = ""
    @encrypted.split("").to_a.each do |x| 
      if UPPERCASE_LETTERS.include? x 
        encrypted += UPPERCASE_LETTERS[ (UPPERCASE_LETTERS.index(x) + @key) % ALPHABET_SIZE]
      elsif LOWERCASE_LETTERS.include? x
        encrypted += LOWERCASE_LETTERS[ (LOWERCASE_LETTERS.index(x) + @key) % ALPHABET_SIZE]
      else
        encrypted += x
      end
    end
     encrypted
  end

  def input_validation
    raise ArgumentError, "Invalid input" unless @key.positive?
  end 
end

puts Caesar.new("What a string!", 5).call