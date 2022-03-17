class Api::V1::BooksController < ApiController
  #before_action :set_book, only: [:index,:show, :update, :destroy]

  def index
    if params[:writer_id].present?
      @writer = Writer.find(params[:writer_id])
      render json: {books: @writer.books.all, status:200 }, status:200
    else
      render json: {books: Book.all, status:200 }
    end
  end

  def show
    @book = Book.find(params[:id])
    render json: {book: @book, status:200}
    
  end

  def create
    @book=Book.new(book_params)
    if @book.save
      render json: {status:200, message:"Books created successfully"}, status:200
    else
      render json: {status:422, message: @book.errors.full_messages.last}
    end

  end

  def update
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    render json: {status:200,message: 'Book deleted successfully'}
  end

  private

  def book_params
    params.permit(:name,:writer_id)
  end
end