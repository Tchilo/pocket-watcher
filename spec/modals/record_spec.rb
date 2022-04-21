require 'rails_helper'

RSpec.describe Record, type: :model do
  subject do
    user = User.new(name: 'jake', email: 'jake@gmail.com', password: 'jake123')
    Record.new(user: user, name: 'Mobius', amount: 300)
  end

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should have a name and amount' do
    subject.name = nil
    subject.amount = nil

    expect(subject).to_not be_valid
  end
end
