require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'jake', email: 'jake@gmail.com', password: 'jake123') }
  before { subject.save }

  it 'should validate user' do
    expect(subject).to be_valid
    subject.name = ''
    expect(subject).to_not be_valid
  end
end
