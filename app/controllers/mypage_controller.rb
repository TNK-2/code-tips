class MypageController < ApplicationController

    def top
        if !logged_in?
            redirect_to '/login'
            return
        end
        @pageNumber = params[:page] || 1
        @user = current_user
        buf = Tip.where(user_id: @user.id).order("updated_at desc")
        @count = buf.count
        @tips = Kaminari.paginate_array(buf).page(@pageNumber).per(10)
    end

    def favourites
        if !logged_in?
            redirect_to '/login'
            return
        end
        @pageNumber = params[:page] || 1
        @user = current_user
        buf = @user.favourite_tip.order("updated_at desc")
        @count = buf.count
        @tips = Kaminari.paginate_array(buf).page(@pageNumber).per(10)
    end

end
