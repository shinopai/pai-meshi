class WantsController < ApplicationController
  before_action :init_want
  before_action :find_user

  def new
  end

  def create
    @want = @user.wants.new(want_params)

    if @want.save
      redirect_to user_wants_path(@user), notice: 'リストに追加しました'
    else
      render 'new'
    end
  end

  def destroy
    want = Want.find(params[:id])
    want.destroy

    redirect_to user_wants_path(@user)
  end


  private
  def want_params
    params.require(:want).permit(:shop_name, :address, :memo)
  end

  def init_want
    @want = Want.new
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
