class RelationshipsController < ApplicationController

    def create
        login_chk ? nil : return
        tip = Tip.find(params[:id])
        current_user.favourite(tip) 
        redirect_to request.referer
    end

    def destroy
        login_chk ? nil : return
        tip = Tip.find(params[:id])
        current_user.unfavourite(tip)
        redirect_to request.referer
    end

end
