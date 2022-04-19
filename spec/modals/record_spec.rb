require 'rails_helper'

RSpec.describe Record, type: :model do
  subject do
    user = User.new(name: 'jake', email: 'jake@gmail.com', password: 'jake123')
    Record.new(name: 'Mobius', amount: 300, user: user)
  end

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should have a name and amount' do
    subject.name = ''
    subject.amount = nil

    expect(subject).to_not be_valid
  end
end
