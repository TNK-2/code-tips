class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  
  def getBaseInfo
      @user = current_user
      @pageNumber = params[:page] || 1
      @categories = Category.all
  end

  def getBaseInfo2
      @user = current_user
      @pageNumber = params[:page] || 1
  end

  def pagenate (buf, method)
      @count = buf.count
      @tips = Kaminari.paginate_array(buf).page(@pageNumber).per(10)
      @method = method
  end

end
