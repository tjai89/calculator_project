require 'spec_helper'

feature 'interest calculator test' do

  scenario 'persent from number with first nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_1", with: "f"
    fill_in "b_1", with: 5
    click_button("persent_from_number")
    expect(page).to have_css("#answer_1", text: "0")
  end

  scenario 'persent from number with second nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_1", with: 5
    fill_in "b_1", with: "f"
    click_button("persent_from_number")
    expect(page).to have_css("#answer_1", text: "0")
  end

  scenario 'persent from number with second nonnumber' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_1", with: "s"
    fill_in "b_1", with: "f"
    click_button("persent_from_number")
    expect(page).to have_css("#answer_1", text: "0")
  end

  scenario 'persent from number with both digits' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_1", with: "100"
    fill_in "b_1", with: 5
    click_button("persent_from_number")
    expect(page).to have_css("#answer_1", text: "5.0")
  end

  scenario 'persent from number with first zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_1", with: 0
    fill_in "b_1", with: 5
    click_button("persent_from_number")
    expect(page).to have_css("#answer_1", text: "0")
  end

  scenario 'persent from number with second zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_1", with: 100
    fill_in "b_1", with: 0
    click_button("persent_from_number")
    expect(page).to have_css("#answer_1", text: "0")
  end

  scenario 'persent from number with both zero' do   
    visit interest_calculator_index_path
    expect(page).to have_content('Interest Calculator')
    fill_in "a_1", with: 0
    fill_in "b_1", with: 0
    click_button("persent_from_number")
    expect(page).to have_css("#answer_1", text: "0")
  end
end
