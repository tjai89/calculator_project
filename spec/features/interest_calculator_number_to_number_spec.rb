require 'spec_helper'

feature 'interest calculator test' do
  scenario 'persent at number to number' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a", with: 5
    fill_in "b", with: 5
    click_button 'Calculate!'
    expect(page).to have_content('= 100%')
  end

  scenario 'persent at number to number with second number as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a", with: 5.1
    fill_in "b", with: 0
    click_button 'Calculate!'
    expect(page).to have_content("= infinity%")
  end

  scenario 'persent at number to number with first number as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a", with: 0
    fill_in "b", with: 5
    click_button 'Calculate!'
    expect(page).to have_content("= 0")
  end

  scenario 'persent at number to number with both numbers as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a", with: 0
    fill_in "b", with: 0
    click_button 'Calculate!'
    expect(page).to have_content("= 0")
  end
end
