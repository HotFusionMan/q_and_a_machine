require 'spec_helper'

describe 'assertions' do
  it 'creating a new one' do
    visit assertions_path
    click_link 'New Assertion'
    fill_in 'Assertion', :with => 'This is the first assertion.'
    click_button 'Create Assertion'

    #within '#flash_notice' do
    #  page.should have_content( 'Assertion has been created!' )
    #end
  end
end