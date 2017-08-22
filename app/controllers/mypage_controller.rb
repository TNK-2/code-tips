class MypageController < ApplicationController

    before_action :getBaseInfo2

    def top
        pagenate(Tip.where(user_id: @user.id).order("updated_at desc"), "post")
    end

    def favourites
        pagenate(@user.favourite_tip.order("updated_at desc"), "post")
    end

    private
        def login_chk
            if !logged_in?
                redirect_to '/login'
                return
            end
        end
end
