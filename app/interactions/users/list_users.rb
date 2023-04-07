class ListUsers < ActiveInteraction::Base
  def execute
    User.all.order(surname: :asc, name: :asc)
  end
end
