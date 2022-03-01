class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :check_logged_in
  before_action :set_q

  def check_logged_in
    return if current_user

    redirect_to root_path
  end

  def set_q
    @q = Shop.ransack(params[:q])
  end
end
