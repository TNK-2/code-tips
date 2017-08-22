class TipsController < ApplicationController

    before_action :getBaseInfo

    def show
        @tip = Tip.find(params[:id])
        @current_user = current_user
        @user = User.find_by(id: @tip.user_id)
        @comments = @tip.comments.order("updated_at desc")
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

    def destroy
        login_chk
        @tip = Tip.find(params[:id])
        @tip.destroy
        redirect_to root_path
    end

    def edit
        login_chk
        @tip = Tip.find(params[:id])
        render 'edit'
    end

    def update
        login_chk
        @tip = Tip.find(params[:id])
        if @tip.update(tip_params)
            redirect_to tip_path
        else
            render 'edit'
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
