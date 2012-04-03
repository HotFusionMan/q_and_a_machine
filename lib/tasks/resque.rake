require 'resque/tasks'

namespace :resque do
  task :setup => :environment do
    require 'resque'

    Resque.redis = Redis.current # Redis.current was set in config/initializers/redis.rb
  end
end
