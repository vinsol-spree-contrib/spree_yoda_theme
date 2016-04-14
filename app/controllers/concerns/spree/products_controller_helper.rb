module Spree
  module ProductsControllerHelper
    def index
      super
      respond_to do |format|
        format.html {  }
        format.js do
          @products = @products.page(params[:page]).per(12)
          render 'index.js'
        end
      end
    end
  end
end
