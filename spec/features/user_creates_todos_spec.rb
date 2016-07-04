require 'rails_helper'

RSpec.feature "User Creates Todos", type: :feature, js: true do
  scenario 'successfully' do
    # setup
    user = create(:user)

    # exercise
    visit '/users/sign_in'
    # binding.pry
    expect(page).to have_css 'h2', text: 'Log in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully.'

    fill_in 'Name', with: 'Pick up groceries.'
    click_button 'Create'

    expect(page).to have_text 'Pick up groceries.'
    expect(page).to have_text 'New item has been saved!'
    # assertions
  end
end
