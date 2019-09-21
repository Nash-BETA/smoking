class ReviewsController < ApplicationController
    def create
        @reviews = Review.new(review_params)
        if @reviews.save
            redirect_to root_path
        end
    end


private

    def review_params
        params.require(:review).permit(:content, :user_id, :store_id)
    end
end

