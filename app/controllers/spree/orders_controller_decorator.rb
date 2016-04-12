module Spree
  OrdersController.class_eval do
    alias_method :orig_update, :update
    def update
      if @order.contents.update_cart(order_params)
        respond_with(@order) do |format|
          format.html do
            if params.has_key?(:checkout)
              @order.next if @order.cart?
              redirect_to checkout_path
            else
              redirect_to cart_path
            end
          end
        end
      else
        respond_with(@order)
      end
    end
  end
end
