module Spree
  module UsersControllerHelper
    def show
      super
      @orders = @orders.page(params[:page]).per(25)
    end
  end
end
