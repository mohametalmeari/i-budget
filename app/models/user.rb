class User < ApplicationRecord
  has_many :groups, foreign_key: 'user_id'
  has_many :records, foreign_key: 'user_id'
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
