module ShopsHelper
  def check_review(review)
    if @current_user == review
      return true
    end
  end
end
