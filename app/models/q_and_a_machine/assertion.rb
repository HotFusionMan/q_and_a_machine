module QAndAMachine
  class Assertion < ActiveRecord::Base
    def initialize( _id = object_id )
      @id = _id
    end

    # after_save :enqueue_if_new

    

    def enqueue
      ::Resque.enqueue( AssertionProcessor, @id )
    end
  end
end
