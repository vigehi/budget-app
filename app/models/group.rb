class Group < ApplicationRecord
  belongs_to :users
  has_many :entities
end
