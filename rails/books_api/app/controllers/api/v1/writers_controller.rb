class Api::V1::WritersController < ApiController
  before_action :set_writer, only: [:show, :update, :destroy, :edit]
  

  def index
    writers = Writer.all
    render json: { writers: ActiveModelSerializers::SerializableResource.new(writers, each_serializer: WriterSerializer), status:200},status:200
  end

  def show
    render json: { writer: @writer, status:200 },status:200
  end

  def new
    @writer = Writer.new(writer_params)
  end

  def create
    @writer = Writer.new(writer_params)
    if @writer.save
      render json: { status:200 , messsage: 'Writer saved successfully'}, status:200
    else
      render json: { status:422 , message: @writer.errors.full_messages.first }, status:422
    end
  end

  def update
    if @writer.update(writer_params)
      render json: { status:200, message: "Writer updated successfully"}, status:200
    else
      render json: { status:422, message: @writer.errors.full_messages.first }, status:422
    end
    
  end

  def destroy
    @writer.destroy
    render json: { status:200, message: "Writer deleted successfuly"}, status:200

  end

  private

  def set_writer
    @writer = Writer.find(params[:id])
  end

  def writer_params
    params.permit(:name)
   
  end


end
