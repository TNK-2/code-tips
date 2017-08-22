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
        if !login_chk 
            return
        end
        @user = User.find_by(id: params[:id])
    end


    def update
        if !login_chk 
            return
        end
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            puts "OK"
            redirect_to mypage_path
        else
            puts "NG"
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
        if !login_chk 
            return
        end
        User.find(params[:id]).destroy
        log_out
        redirect_to root_url
    end


    private
        def user_params
            params.require(:user).permit(:id, :name, :password, :password_confirmation, :giturl)
        end

end
