module Spree
  module UsersControllerHelper

    ORDERS_PAGINATION_LIMIT = 25

    def show
      super
      @orders = @orders.page(params[:page]).per(ORDERS_PAGINATION_LIMIT)
    end
  end
end
