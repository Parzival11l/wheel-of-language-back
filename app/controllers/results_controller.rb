class ResultsController < ApplicationController
  before_action :authenticate_user!

  def index
    p current_user
    results = current_user.results.all

    render json: results, status: :ok
  end

  def create
    result = Result.new(info_params)

    if result.save
      render json: { result: result }, status: :created
    else
      render json: { error: result.errors }, status: :bad_request
    end
  end

  def show
    result = Result.find_by_user_id(params[:id])
    if result
    render json: {result: result }, status: :accepted
    else
      render json: :bad_request
    end
  end



  def result_params
    params.require(:result).permit(
      :date,
      :game_time,
      :result,
      :time_start
    )
  end
end