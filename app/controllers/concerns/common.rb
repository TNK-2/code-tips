module Common extend ActiveSupport::Concern

    def getBaseInfo
        baseInfo = {}
        baseInfo[:pageNumber] = params[:page] || 1
        baseInfo[:categories] = Category.all
        return baseInfo
    end

end