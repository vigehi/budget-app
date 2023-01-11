class Group < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :transactions
  has_many :entities, through: :transactions

  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true
end
