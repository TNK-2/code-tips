class StaticPagesController < ApplicationController

    before_action :getBaseInfo

    def home
        @categoryName = "New Tips"
        @tips = Tip.page(@pageNumber).per(20).order("updated_at desc")
    end

    def category
        @categoryName = params[:name]
        buf = Tip.where(category_id: params[:id]).order("updated_at desc")
        @tips = Kaminari.paginate_array(buf).page(@pageNumber).per(20)
        render 'home'
    end

    private
        def getBaseInfo
            @pageNumber = params[:page] || 1
            @categories = Category.all
        end


end
