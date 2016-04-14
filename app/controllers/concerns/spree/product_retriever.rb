module Spree
  module ProductRetriever
    extend ActiveSupport::Concern
    included do
      private
        def retrieve_searcher_products(taxon_id)
          build_searcher(params.merge(taxon: taxon_id, include_images: true)).retrieve_products.includes(:variants, :variant_images)
        end
        helper_method :retrieve_searcher_products
    end
  end
end
