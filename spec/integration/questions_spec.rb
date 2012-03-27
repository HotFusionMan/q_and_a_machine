require 'spec_helper'

describe 'questions' do
  it 'creating a new one' do
    visit questions_path
    click_link 'New Question'
    fill_in 'Question', :with => 'What was the first question?'
    click_button 'Create Question'

    #within '#flash_notice' do
    #  page.should have_content( 'Question has been created!' )
    #end
  end
end