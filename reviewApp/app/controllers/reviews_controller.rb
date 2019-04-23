class ReviewsController < ApplicationController

before_action :authorize, :only => [ :new, :edit, :destory]

def index
	@reviews = Review.where('productId = ' + params[:productId])
end

def new
	@review=Review.new
	@profile=Profile.new
	@product=Product.new
end

def create 
	@review=Review.new(review_params)
	@review.datePosted = Time.now
	@review.reviewDate = Time.now

	@reviewProfile = Profile.where('userId =' + current_user.id.to_s).first
	@review['reviewAuthor'] = @reviewProfile['fullName']
	@review['profileId'] = @reviewProfile['id']

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
