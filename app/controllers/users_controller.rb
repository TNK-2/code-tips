class UsersController < ApplicationController


    before_action :getBaseInfo2


    def new 
        @user = User.new
    end


    def show
        @user = User.find_by(id: params[:id])
        pagenate(Tip.where(user_id: @user.id).order("updated_at desc"), "get")
    end


    def edit
        login_chk ? nil : return
        @user = User.find_by(id: params[:id])
    end


    def update
        login_chk ? nil : return
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to mypage_path
        else
            render 'edit'
        end
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


    def destroy
        login_chk ? nil : return
        User.find(params[:id]).destroy
        log_out
        redirect_to root_url
    end


    private
        def user_params
            params.require(:user).permit(:id, :name, :password, :giturl)
        end

end
