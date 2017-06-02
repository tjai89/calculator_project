require 'spec_helper'

feature 'interest calculator test' do

  scenario 'substract persent from number with first nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_3", with: "f"
    fill_in "b_3", with: 5
    click_button("substract_persent_from_number")
    expect(page).to have_css("#answer_3", text: "5")
  end  

  scenario 'substract persent from number with second nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_3", with: 5
    fill_in "b_3", with: "f"
    click_button("substract_persent_from_number")
    expect(page).to have_css("#answer_3", text: "0")
  end 

  scenario 'substract persent from number with both nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_3", with: "f"
    fill_in "b_3", with: "f"
    click_button("substract_persent_from_number")
    expect(page).to have_css("#answer_3", text: "0")
  end  

  scenario 'substract persent from number' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_3", with: 5
    fill_in "b_3", with: 5
    click_button("substract_persent_from_number")
    expect(page).to have_css("#answer_3", text: "4.75")
  end

  scenario 'substract persent from number with second number as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_3", with: 5
    fill_in "b_3", with: 0
    click_button("substract_persent_from_number")
    expect(page).to have_css("#answer_3", text: "0")
  end

  scenario 'substract persent from number with first number as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_3", with: 0
    fill_in "b_3", with: 5
    click_button("substract_persent_from_number")
    expect(page).to have_css("#answer_3", text: "5")
  end

  scenario 'substract persent from number with both numbers as zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_3", with: 0
    fill_in "b_3", with: 0
    click_button("substract_persent_from_number")
    expect(page).to have_css("#answer_3", text: "0")
  end
end
