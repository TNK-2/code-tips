class StaticPagesController < ApplicationController

    before_action :getBaseInfo

    def home
        @categoryName = "New Tips"
        @tips = Tip.page(@pageNumber).per(20).order("updated_at desc")
    end

    def category
        @categoryName = params[:name]
        pagenate(Tip.where(category_id: params[:id]).order("updated_at desc"), "post")
        render 'home'
    end


end
