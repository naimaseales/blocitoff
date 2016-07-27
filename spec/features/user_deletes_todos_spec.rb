require 'rails_helper'

RSpec.feature "User Deletes Todos", type: :feature, js: true do
  scenario 'successfully' do
    # setup
    user = create(:user)
    item = create(:item, name: "Pick up groceries.", user: user)

    # exercise
    visit '/users/sign_in'

    expect(page).to have_css 'h2', text: 'Log in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully.'

    expect(page).to have_text 'Pick up groceries.'
    # binding.pry
    find('a[title=Delete]').click

    expect(page).to_not have_text 'Pick up groceries.'
    # binding.pry
    # assertions
  end
end
