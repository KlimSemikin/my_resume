class User < ApplicationRecord
  enum genders: [:female, :male]

  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests

  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  validates :email, uniqueness: true
end
