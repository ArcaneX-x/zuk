# frozen_string_literal: true

require 'redis'
require 'connection_pool'

class RedisCacher
  include Singleton

  attr_reader :pool

  def initialize
    @pool = ConnectionPool.new(pool_config) do
      Redis.new(redis_config)
    end
  end

  def set(key, value)
    pool.with do |conn|
      conn.set(key, value)
    end
  end

  def set_with_expire(key, value, expire)
    pool.with do |conn|
      conn.setex(key, expire, value)
    end
  end

  def ttl(key)
    pool.with do |conn|
      conn.ttl(key)
    end
  end

  def get(key)
    pool.with do |conn|
      conn.get(key)
    end
  end

  def pool_config
    {
      size: ENV.fetch('RAILS_MAX_THREADS', 10).to_i,
      timeout: ENV.fetch('REDIS_TIMEOUT', 3)
    }
  end

  def redis_config
    Rails.application.config_for(:redis)
  end
end
