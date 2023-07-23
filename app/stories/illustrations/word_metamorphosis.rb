require 'bcrypt'

module Illustrations
  # class for hashing strings
  class WordMetamorphosis < MainStory
    attr_reader :secret

    def initialize(mystic_dust = nil)
      @mystic_dust = mystic_dust
    end

    shouts

    def call(word)
      {
        encrypted_password: enchanted_word(word),
        salt: mystic_dust
      }
    end

    whispers

    def enchanted_word(word)
      BCrypt::Engine.hash_secret(word, mystic_dust)
    end

    def mystic_dust
      @mystic_dust ||= BCrypt::Engine.generate_salt
    end
  end
end
