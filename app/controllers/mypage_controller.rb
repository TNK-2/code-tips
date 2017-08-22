class MypageController < ApplicationController

    before_action :getBaseInfo2

    def top
        if !login_chk 
            return
        end
        pagenate(Tip.where(user_id: @user.id).order("updated_at desc"), "post")
    end

    def favourites
        if !login_chk 
            return
        end
        pagenate(@user.favourite_tip.order("updated_at desc"), "post")
    end

end
