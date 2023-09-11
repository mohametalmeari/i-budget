class Record < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :amount, presence: true

  belongs_to :group
  belongs_to :user
end
return
