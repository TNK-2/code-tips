class MypageController < ApplicationController

    before_action :getBaseInfo2

    def top
        if !logged_in?
            redirect_to '/login'
            return
        end
        pagenate(Tip.where(user_id: @user.id).order("updated_at desc"), "post")
    end

    def favourites
        if !logged_in?
            redirect_to '/login'
            return
        end
        pagenate(@user.favourite_tip.order("updated_at desc"), "post")
    end

end
