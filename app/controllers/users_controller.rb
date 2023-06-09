class UsersController < ApplicationController
  def create
    outcome = CreateUser.run(params.fetch(:user, {}))

    if outcome.valid?
      redirect_to(outcome.result)
    else
      @user = outcome
      render(:new, status: :unprocessable_entity)
    end
  end
end
