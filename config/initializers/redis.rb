require 'redis'
require 'mock_redis'
# require 'redis/objects'

unless ENV['RAILS_ENV'] == 'test'
  Redis.current = Redis.new( :host => '127.0.0.1', :port => 6379 )
else
  Redis.current = MockRedis.new
end