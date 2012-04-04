require 'spec_helper'


describe QAndAMachine::AssertionProcessor do
  it ".perform should feed assertion's data to ReVerb, put ReVerb's output back into the assertion record" do
    assertion = QAndAMachine::Assertion.new( :assertion => 'Jesse is a friend .' )
    assertion.save!
    assertion_id = assertion.id

    QAndAMachine::AssertionProcessor.perform( assertion_id )

    processed_assertion = QAndAMachine::Assertion.find( assertion_id )
    processed_assertion.arg1.should == 'Jesse'
    processed_assertion.relationship.should == 'is'
    processed_assertion.arg2.should == 'a friend'
    processed_assertion.arg1_normalized.should == 'jesse'
    processed_assertion.relationship_normalized.should == 'be'
    processed_assertion.arg2_normalized.should == 'a friend'
    processed_assertion.confidence.should > 0.0
    processed_assertion.confidence.should < 1.0
  end
end
