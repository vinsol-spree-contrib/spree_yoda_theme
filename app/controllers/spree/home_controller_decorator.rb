module Spree
  HomeController.class_eval do

    alias_method :orig_index, :index

    def index
      @featured_taxons = Spree::Taxon.where(is_featured: true).includes(:products)
    end

    private
      def retrieve_searcher_products(taxon_id)
        build_searcher(taxon: taxon_id, include_images: true).retrieve_products.limit(3)
      end
      helper_method :retrieve_searcher_products

  end
end
