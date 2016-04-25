module Spree
  module ProductsControllerHelper

    SEARCH_RESULTS_PAGINATION_LIMIT = 16

    def index
      super
      respond_to do |format|
        format.html {  }
        format.js do
          @products = @products.page(params[:page]).per(SEARCH_RESULTS_PAGINATION_LIMIT)
          render 'index.js'
        end
      end
    end
  end
end
