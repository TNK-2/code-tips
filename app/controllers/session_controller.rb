class SessionController < ApplicationController

    def new 
    end

    def create
        user = User.find_by(name: params[:session][:name].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in user
            redirect_to mypage_path
        else
            flash[:danger] = 'Invalid name/password combination'
            render 'new'
        end
    end

end
