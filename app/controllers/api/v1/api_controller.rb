class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render json: { message: 'Objeto não encontrada' }, status: :not_found
  end
end