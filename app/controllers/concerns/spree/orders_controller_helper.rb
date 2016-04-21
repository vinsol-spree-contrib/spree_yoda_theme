module Spree
  module OrdersControllerHelper
    def edit
      super
      @products = Spree::Product.limit(3) if @order.line_items.empty?
    end
  end
end

