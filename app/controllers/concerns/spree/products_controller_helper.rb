module Spree
  module ProductsControllerHelper

    SEARCH_RESULTS_PAGINATION_LIMIT = 16

    def index
      if params[:taxon].blank? && Spree::Config[:theme_name] == 'yoda'
        @taxon = Spree::Taxon.find_by(name: 'Categories')
        params.merge!(taxon: @taxon.id)
      end
      super
      if Spree::Config[:theme_name] == 'yoda'
        respond_to do |format|
          format.html do
            @taxon ||= Spree::Taxon.find_by(name: 'Categories')
            @products = Spree::Product.where(id: Spree::Classification.where(taxon_id: @taxon.self_and_descendants.pluck(:id)).pluck(:product_id).uniq).page(params[:page]).per(SEARCH_RESULTS_PAGINATION_LIMIT)
          end
          format.js do
            @products = @products.per(SEARCH_RESULTS_PAGINATION_LIMIT) if Spree::Config[:theme_name] == 'yoda'
            render 'index.js'
          end
        end
      end
    end
  end
end
