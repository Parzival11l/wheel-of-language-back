class InfosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    info = Info.update(info_params)

    if info
      render json: { info: info }, status: :accepted
    else
      render json: { error: info.errors }, status: :bad_request
    end
  end

  def show
    info = Info.find_by_user_id(params[:id])
    if info
      render json: {info: info }, status: :accepted
    else
      render json: :bad_request

    end
  end


  def info_params
      params.require(:info).permit(
        :first_name,
        :last_name,
        :age,
        :school,
        :disabled
      )
  end

end