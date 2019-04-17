class ReviewsController < ApplicationController

def index
	@reviews=Review.all
end

def new
	@review=Review.new
end

def create 
	@review=Review.new(review_params)
	@review.save
	redirect_to @review
end

def edit
	@review = Review.find(params[:id])
end

def update 
	@review = Review.find(params[:id])
	if @review.update(review_params)
		redirect_to @review
	else 
		render 'edit'
	end
end

def destroy
	@review = Review.find(params[:id])
	@review.destroy
	redirect_to reviews_path
end

def show 
	@review=Review.find(params[:id])
end

private

def review_params
	params.require(:review).permit(:reviewAuthor, :prodRating, :prodReview, :reviewDate, :datePosted, :productId, :profileId)
end

end
