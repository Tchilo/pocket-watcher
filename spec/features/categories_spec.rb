require 'rails_helper'

RSpec.feature 'categories index page', js: true, type: :feature do
  background do
    visit user_session_path
    @user = User.create!(name: 'Jake', email: 'jake@mail.com', password: 'jake123')

    fill_in 'Email', with: 'jake@mail.com'
    fill_in 'Password', with: 'jake123'
    click_button 'Log in'

    @category = @user.categories.create!(name: 'libro')

    @category.icon.attach(
      io: File.open(Rails.root.join('spec', 'pics', 'libro.jpeg')),
      filename: 'libro.jpeg',
      content_type: 'application/jpeg'
    )
    @category.save!
    visit categories_path
  end

  it 'should see users categories' do
    expect(page).to have_content 'libro'
  end

  it 'should show total amount' do
    expect(page).to have_content 'Total'
  end

  it 'should have a "ADD A NEW CATEGORY" button' do
    expect(page).to have_content 'Add'
  end
end
