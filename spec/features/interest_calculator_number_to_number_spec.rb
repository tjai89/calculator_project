require 'spec_helper'

feature 'interest calculator test' do

  scenario 'persent at number to number with first nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_0", with: "f"
    fill_in "b_0", with: 5
    click_button("number_to_number")
    expect(page).to have_css("#answer_0", text: "0")
  end  

  scenario 'persent at number to number with second nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_0", with: 5
    fill_in "b_0", with: "f"
    click_button("number_to_number")
    expect(page).to have_css("#answer_0", text: "infinity")
  end 

  scenario 'persent at number to number with both nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_0", with: "f"
    fill_in "b_0", with: "f"
    click_button("number_to_number")
    expect(page).to have_css("#answer_0", text: "0")
  end  

  scenario 'persent at number to number' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_0", with: 5
    fill_in "b_0", with: 5
    click_button("number_to_number")
    expect(page).to have_css("#answer_0", text: "100.0%")
  end

  scenario 'persent at number to number with second number as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_0", with: 5.1
    fill_in "b_0", with: 0
    click_button("number_to_number")
    expect(page).to have_css("#answer_0", text: "infinity%")
  end

  scenario 'persent at number to number with first number as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_0", with: 0
    fill_in "b_0", with: 5
    click_button("number_to_number")
    expect(page).to have_css("#answer_0", text: "0%")
  end

  scenario 'persent at number to number with both numbers as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_0", with: 0
    fill_in "b_0", with: 0
    click_button("number_to_number")
    expect(page).to have_css("#answer_0", text: "0")
  end
end
