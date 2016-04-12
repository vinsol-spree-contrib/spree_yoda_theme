module Spree
  CheckoutController.class_eval do
    private
      def ensure_valid_state
        if @order.state != correct_state && !skip_state_validation?
          flash.keep
          @order.state = correct_state
          respond_to do |format|
            format.html { redirect_to checkout_state_path(@order.state) }
            format.js { render js: "window.location.href = '#{ checkout_state_path(@order.state) }'" }
          end
        end
      end

      def load_order_with_lock
        @order = current_order(lock: true)
        unless @order
          respond_to do |format|
            format.html { redirect_to(spree.cart_path) && return }
            format.js { render js: "window.location.href = '#{ spree.cart_path }'" }
          end
        end
      end

      def ensure_valid_state_lock_version
        if params[:order] && params[:order][:state_lock_version]
          @order.with_lock do
            unless @order.state_lock_version == params[:order].delete(:state_lock_version).to_i
              flash[:error] = Spree.t(:order_already_updated)
              respond_to do |format|
                format.html { redirect_to checkout_state_path(@order.state) && return }
                format.js do
                  render js: "window.location.href = '#{ checkout_state_path(@order.state) }'"
                  return
                end
              end
            end
            @order.increment!(:state_lock_version)
          end
        end
      end

      def set_state_if_present
        if params[:state]
          if @order.can_go_to_state?(params[:state]) && !skip_state_validation?
            respond_to do |format|
              format.html { redirect_to checkout_state_path(@order.state) }
              format.js { render js: "window.location.href = '#{ checkout_state_path(@order.state) }'" }
            end
          end
          @order.state = params[:state]
        end
      end
      def ensure_checkout_allowed
        unless @order.checkout_allowed?
          respond_to do |format|
            format.html { redirect_to(spree.cart_path) }
            format.js { render js: "window.location.href = '#{ spree.cart_path }'" }
          end
        end
      end

      def ensure_order_not_completed
        if @order.completed?
          respond_to do |format|
            format.html { redirect_to(spree.cart_path) }
            format.js { render js: "window.location.href = '#{ spree.cart_path }'" }
          end
        end
      end
  end
end
