class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :icon, presence: true
  validates_uniqueness_of :name, scope: :user_id

  has_many :records, foreign_key: 'group_id'
  belongs_to :user

  def total_amount
    total = 0
    records.each do |record|
      total += record.amount
    end
    total
  end
end
return
