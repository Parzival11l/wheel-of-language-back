class User::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  def create
    user = User.new(sigh_up_params)

    if user.
      sign_up :user, sigh_up_params
      render json: { user: user }, status: :created
    else
      render json: { error: user.errors }, status: :bad_request
    end
  end

  protected

  def sigh_up_params
    params.require(:user).permit(
      :login,
      :password
    )
  end
end