require 'spec_helper'
# require 'mock_redis'
require 'json'

describe QAndAMachine::Assertion do
  # before( :each ) do
  #   Redis.current = MockRedis.new
  # end


  it '#enqueue should queue a job' do
    user_id = 42
    assertion = QAndAMachine::Assertion.new( :user_id => user_id )
    assertion.save!
    assertion_id = assertion.id

    assertion.enqueue

    # redis_keys = Redis.current.keys( '*' )
    # redis_keys.each { |key|
    #   puts "#{key}\t#{Redis.current.type(key)}"
    # }

    queue_name = 'resque:queue:' + QAndAMachine::AssertionProcessor.instance_variable_get( :@queue ).to_s

    Redis.current.llen( queue_name ).should > 0

    job = JSON.parse( Redis.current.lindex( queue_name, 0 ) )
    job['args'].size.should == 1
    job['args'].first.should == assertion_id
  end


  it '#save[!] should enqueue a job' do
    assertion = QAndAMachine::Assertion.new

    assertion.should_receive( :enqueue )

    assertion.save!
  end
end
