class User < ApplicationRecord
  enum genders: [:female, :male]

  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests

  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  validates_presence_of :name, :surname, :patronymic, :email, :age, :nationality, :country, :gender
  validates :email, uniqueness: true
  validates :age, numericality: { in: 1..90, only_integer: true }
  validates :gender, inclusion: { in: genders.keys }
end
