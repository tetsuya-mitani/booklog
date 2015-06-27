class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @review = Review.new(
      book_id: params[:book_id],
      user_id: current_user.id,
      body: review_params["body"]
    )
    @review.save
    redirect_to book_url(@review.book)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:body)
    end
end
