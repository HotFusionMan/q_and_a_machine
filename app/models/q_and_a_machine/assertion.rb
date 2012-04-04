module QAndAMachine
  class Assertion < ActiveRecord::Base
    after_create :enqueue

    def enqueue
      ::Resque.enqueue( AssertionProcessor, id )
    end
  end
end
