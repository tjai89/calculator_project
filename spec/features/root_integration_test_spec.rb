require 'spec_helper'

feature 'Links test' do
  scenario 'visit root and check interest_calculator link' do   
    visit root_path 
    expect(page).to have_content('Interest Calculator')
    click_link 'Interest Calculator'
    expect(page).to have_http_status(:success)
  end
end
