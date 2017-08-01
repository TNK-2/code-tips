class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        @tips = Tip.where(user_id: @user.id).order("updated_at desc")
    end    

end
