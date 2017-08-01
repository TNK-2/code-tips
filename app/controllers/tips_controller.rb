class TipsController < ApplicationController

    before_action :getBaseInfo

    def show
        @tip = Tip.find(params[:id])
        @user = User.find_by(id: @tip.user_id)
    end

    def new
        @tip = Tip.new
        if logged_in?
            render 'new'
        else
            redirect_to '/login'
        end
    end

    def create
        @tip = Tip.new(tip_params)
        if @tip.save
            redirect_to @tip
        else
            render 'new'
        end
    end

    private
        def getBaseInfo
            @user = current_user
            @pageNumber = params[:page] || 1
            @categories = Category.all
        end

        def tip_params
            params.require(:tip).permit(:title, :category_id, :contents, :user_id)
        end

end
