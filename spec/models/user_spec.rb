require 'rails_helper'

RSpec.describe User, type: :model do
  include Devise::Test::IntegrationHelpers
  subject do
    User.new(name: 'Chris siku', password: '123456', email: 'chris2@gmail.com')
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

    it 'Email should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
