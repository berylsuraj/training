class Api::V1::WritersController < ApiController
  before_action :set_writer

  def show
    render json: @writer, include: ['books']
  end

  private

  def set_writer
    @writer = Writer.find(params[:id])
  end
end
