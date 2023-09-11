class Group < ApplicationRecord
  has_many :records, foreign_key: 'group_id'
  belongs_to :user
end
