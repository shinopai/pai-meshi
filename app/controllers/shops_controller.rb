class ShopsController < ApplicationController
  require 'json'
  skip_before_action :check_logged_in, only: %i(index all show)
  before_action :set_q, only: %i(index search)

  def index
    @shops = Shop.all.order(created_at: :desc).limit(8)
  end

  def all
    @shops = Shop.page(params[:page]).per(8).order(created_at: :desc)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def search_form
  end

  def new_shop_results
  end

  def new_form
    @shop = Shop.new
    @shop_data = params[:shop]
  end


  def search
    search_word = params[:search]

    res = JSON.parse(Shop.search(search_word))
    @results = res['results']
    logger.debug(@results)

    render 'new_shop_results'
  end

  def create
    logger.debug('ここから')
    logger.debug(params)
    categories = Category.where(id: params[:Category][:category_name])
    payments = Payment.where(id: params[:Payment][:payment_name])

    shop = Shop.new(shop_params)

    if categories.exists?
      categories.size.times do |index|
        shop.add_category(categories[index])
      end
    end

    if payments.exists?
      payments.size.times do |index|
        shop.add_payment(payments[index])
      end
    end

    if shop.save
      redirect_to root_path, notice: '新規登録が完了しました'
      else
        render 'new_form'
    end
  end

  def search
    @shops = @q.result
  end


  private
  def shop_params
    params.require(:shop).permit(:shop_name, :address, :shop_image, :parking)
  end

  def set_q
    @q = User.ransack(params[:q])
  end
end
