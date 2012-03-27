require 'spec_helper'

describe 'assertions' do
  it 'creating a new one' do
    visit questions_path
    click_link 'New Assertion'
    fill_in 'Assertion', :with => 'What was the first question?'
    click_button 'Create Assertion'

    #within '#flash_notice' do
    #  page.should have_content( 'Assertion has been created!' )
    #end
  end
end