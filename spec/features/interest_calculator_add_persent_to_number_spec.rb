require 'spec_helper'

feature 'interest calculator test' do

  scenario 'add persent to number with first nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_2", with: "f"
    fill_in "b_2", with: 5
    click_button("add_persent_to_number")
    expect(page).to have_css("#answer_2", text: "5")
  end  

  scenario 'add persent to number with second nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_2", with: 5
    fill_in "b_2", with: "f"
    click_button("add_persent_to_number")
    expect(page).to have_css("#answer_2", text: "0")
  end 

  scenario 'add persent to number with both nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_2", with: "f"
    fill_in "b_2", with: "f"
    click_button("add_persent_to_number")
    expect(page).to have_css("#answer_2", text: "0")
  end  

  scenario 'add persent to number' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_2", with: 5
    fill_in "b_2", with: 5
    click_button("add_persent_to_number")
    expect(page).to have_css("#answer_2", text: "5.25")
  end

  scenario 'add persent to number with second number as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_2", with: 5
    fill_in "b_2", with: 0
    click_button("add_persent_to_number")
    expect(page).to have_css("#answer_2", text: "0")
  end

  scenario 'add persent to number with first number as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_2", with: 0
    fill_in "b_2", with: 5
    click_button("add_persent_to_number")
    expect(page).to have_css("#answer_2", text: "5")
  end

  scenario 'add persent to number with both numbers as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_2", with: 0
    fill_in "b_2", with: 0
    click_button("add_persent_to_number")
    expect(page).to have_css("#answer_2", text: "0")
  end
end
