class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token


  def new
    render json: { user: current_user}, status: :ok
  end

  def create
    user = User.find_by_login(sign_in_params[:login])
    if user.present? && user.valid_password?(sign_in_params[:password])
      sign_in(:user, user)
      render json: { user: user }, status: :accepted
    else
      render json: {errors: user.errors }, status: :unauthorized
    end

  end

  def destroy
    user = User.find_by_login(sign_in_params[:login])
    if user.destroy
      sign_out(:user, user )
      render json: { user: user }, status: :ok
    else
      render json: { error: user.errors }, status: :bad_request
    end
  end

  private

  def sign_in_params
    params.require(:user).permit(
      :login,
      :password
    )
  end

end
