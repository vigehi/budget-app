require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
  subject do
    user = User.create(name: 'Chris siku', password: '123456', email: 'chris3@gmail.com')
    group = Group.create(name: 'Group 1', author: user)
    Entity.create(name: 'Ford 150', amount: '100', author: user)
    GroupEntity.new(group: group, entity: Entity.first)
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'Group should be valid' do
      expect(subject).to be_valid
    end

    it 'Group should be present' do
      subject.group = nil
      expect(subject).to_not be_valid
    end

    it 'Entity should be present' do
      subject.entity = nil
      expect(subject).to_not be_valid
    end
  end
end
