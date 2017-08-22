class MypageController < ApplicationController

    before_action :getBaseInfo2
    before_action :login_chk

    def top
        pagenate(Tip.where(user_id: @user.id).order("updated_at desc"), "post")
    end

    def favourites
        pagenate(@user.favourite_tip.order("updated_at desc"), "post")
    end

end
