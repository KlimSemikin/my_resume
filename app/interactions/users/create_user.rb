class CreateUser < ActiveInteraction::Base
  string :name
  string :surname
  string :patronymic
  string :email
  string :nationality
  string :country
  string :gender
  integer :age, default: nil
  array :interests, default: []
  array :skills, default: []

  validates :name, :surname, :patronymic, :email, :nationality, :country, :gender, :age, presence: true
  validates :age, numericality: { in: 1..90, only_integer: true }
  validates :gender, inclusion: { in: User.genders.keys }
  # email uniqueness validation locates in User model

  def to_model
    User.new
  end

  def execute
    user = new_user_from_inputs
    user.fullname = full_name
    user.interests = compose(FindInterests, interests_names: interests)
    user.skills = compose(FindSkills, skills_names: skills)

    unless user.save
      errors.merge!(user.errors)
    end

    user
  end

  private

  def new_user_from_inputs
    User.new(inputs.except(:interests, :skills))
  end

  def full_name
    "#{surname} #{name} #{patronymic}"
  end
end
