class UsersController < ApplicationController

    before_action :getBaseInfo2

    def new 
        @user = User.new
    end

    def show
        @user = User.find_by(id: params[:id])
        pagenate(Tip.where(user_id: @user.id).order("updated_at desc"), "get")
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to mypage_path
        else
            render 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :password)
        end

end
