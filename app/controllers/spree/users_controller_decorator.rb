module Spree
  UsersController.class_eval do
    def show
      @orders = @user.orders.complete.order('completed_at desc').page(params[:page]).per(25)
    end
  end
end
