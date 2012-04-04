module QAndAMachine
  class AssertionProcessor
    @queue = :assertions

    def self.perform( assertion_id )
      assertion = Assertion.find( assertion_id )

      # feed assertion's data to ReVerb, put ReVerb's output back into the assertion record
      external_processor = IO.popen( "java -Xmx512m -jar lib/reverb.jar", 'w+' )
      external_processor.print assertion.assertion
      external_processor.close_write
      external_processor_output = external_processor.gets.chomp!.split( "\t" )

      assertion.arg1 = external_processor_output[2]
      assertion.relationship = external_processor_output[3]
      assertion.arg2 = external_processor_output[4]
      assertion.confidence = external_processor_output[11]
      assertion.arg1_normalized = external_processor_output[15]
      assertion.relationship_normalized = external_processor_output[16]
      assertion.arg2_normalized = external_processor_output[17]

      assertion.save!
    end
  end
end
