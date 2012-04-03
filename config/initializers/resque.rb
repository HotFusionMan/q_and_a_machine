require 'resque'

Resque.redis = Redis.current # Redis.current was set in config/initializers/redis.rb