class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token

  def create
    user = User.new(sign_up_params)


    if user.save
      info = Info.create(user_id: user.id)
      sign_up :user, user
      render json: { user: user }, status: :created
    else
      render json: { error: user.errors }, status: :bad_request
    end
  end

  protected

  def sign_up_params
    params.require(:user).permit(
      :login,
      :password
    )
  end
end
