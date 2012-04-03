require 'spec_helper'
# require 'mock_redis'
require 'json'

describe QAndAMachine::Assertion do
  # before( :each ) do
  #   Redis.current = MockRedis.new
  # end


  it '#enqueue should queue a job' do
    assertion_id = 42

    assertion = QAndAMachine::Assertion.new( :id => assertion_id )
    assertion.enqueue

    # redis_keys = Redis.current.keys( '*' )
    # redis_keys.each { |key|
    #   puts "#{key}\t#{Redis.current.type(key)}"
    # }

    queue_name = 'resque:queue:' + QAndAMachine::AssertionProcessor.instance_variable_get( :@queue ).to_s
    Redis.current.llen( queue_name ).should == 1

    job = JSON.parse( Redis.current.lpop( queue_name ) ) # Use lpop so we return Redis to its initial state.
    job['args'].size.should == 1
    job['args'].first['id'].should == assertion_id
  end
end
