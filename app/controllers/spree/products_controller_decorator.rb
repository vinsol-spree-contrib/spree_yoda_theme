module Spree
  ProductsController.class_eval do

    alias :orig_index :index

    def index
      orig_index
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
