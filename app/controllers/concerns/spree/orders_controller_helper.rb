module Spree
  module OrdersControllerHelper

    PRODUCTS_LIMIT = 3

    def edit
      super
      @products = Spree::Product.limit(PRODUCTS_LIMIT) if @order.line_items.empty?
    end
  end
end
