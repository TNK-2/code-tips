class RelationshipsController < ApplicationController

    def create
        if !login_chk 
            return
        end
        tip = Tip.find(params[:id])
        current_user.favourite(tip) 
        redirect_to request.referer
    end

    def destroy
        if !login_chk 
            return
        end
        tip = Tip.find(params[:id])
        current_user.unfavourite(tip)
        redirect_to request.referer
    end

end
