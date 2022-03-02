class ReviewsController < ApplicationController
  # skip_before_action :check_logged_in, only: %i(index)
  before_action :find_user, except: %i(destroy)
  before_action :find_shop, except: %i(destroy)
  before_action :init_review, except: %i(destroy)

  def new
  end

  def create
    @review = @user.reviews.new(review_params)
    @review.shop_id = @shop.id

    if @review.save
      redirect_to shop_path(@shop), notice: 'レビューを投稿しました'
    else
      render 'new'
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy

    redirect_to request.referer
  end

  private
  def review_params
    params.require(:review).permit(:price, :score, :comment)
  end

  def find_user
    @user = User.find(params[:user])
  end

  def find_shop
    @shop = Shop.find(params[:shop])
  end

  def init_review
    @review = Review.new
  end
end
