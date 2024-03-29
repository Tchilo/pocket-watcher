require 'rails_helper'

RSpec.feature Category, type: :model do
  background do
    @user = User.create!(name: 'Jake', email: 'jake@mail.com', password: 'jake123')

    @category = @user.categories.create!(name: 'Musica')

    @category.icon.attach(
      io: File.open(Rails.root.join('spec', 'pics', 'libro.jpeg')),
      filename: 'libro.jpeg',
      content_type: 'application/jpeg'
    )
    @category.save!
  end

  it 'should be valid' do
    expect(@category).to be_valid
  end

  it 'should have a name and an icon' do
    @category.name = ''

    expect(@category).to_not be_valid
  end
end
