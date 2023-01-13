require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    user = User.create(name: 'Chris siku', password: '123456', email: 'chris1@gmail.com')
    Group.new(name: 'Bike', icon: 'https://icon.com/icon.jpg', author: user)
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'Name should be valid' do
      expect(subject).to be_valid
    end

    it 'Name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Icon should be present' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end
