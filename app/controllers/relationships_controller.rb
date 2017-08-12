class RelationshipsController < ApplicationController

    def create
        if !logged_in?
            redirect_to login_path
        end
        tip = Tip.find(params[:id])
        current_user.favourite(tip) 
        redirect_to request.referer
    end

    def destroy
        if !logged_in?
            redirect_to login_path
        end
        tip = Tip.find(params[:id])
        current_user.unfavourite(tip)
        redirect_to request.referer
    end

end
