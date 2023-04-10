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
  string :skills, default: '' # Не совсем понял этот момент. С одной стороны было бы логично переделать по аналогии
                              # с interests т.е чтобы на вход приходил массив skills, а не строка как в условии задания,
                              # так бы я и сделал, если бы знал, что имею доступ к фронту, чтобы там тоже это поменять,
                              # однако сделал со строкой, предположив, что не должен менять входные данные.

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
    user.skills = compose(FindSkills, skills_names: skills.split(','))

    errors.merge!(user.errors) unless user.save

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
