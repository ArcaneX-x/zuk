module Illustrations
  module CachingBehaviour
    whispers

    def redis
      @redis ||= RedisCacher.instance
    end
  end
end
