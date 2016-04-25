module Spree
  module ProductsControllerHelper

    SEARCH_RESULTS_PAGINATION_LIMIT = 16

    def index
      super
      if Spree::Config[:theme_name] == 'yoda'
        taxon = Spree::Taxon.find_by(name: 'Categories')
        @products = Spree::Product.where(id: Spree::Classification.where(taxon_id: taxon.self_and_descendants.pluck(:id)).pluck(:product_id).uniq).page(params[:page]).per(SEARCH_RESULTS_PAGINATION_LIMIT)
      end
      respond_to do |format|
        format.html {  }
        format.js do
          render 'index.js'
        end
      end
    end
  end
end
