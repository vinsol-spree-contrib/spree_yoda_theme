module Spree
  module HomeControllerHelper
    def index
      @featured_taxons = Spree::Taxon.where(is_featured: true).includes(:products)
      super
    end
  end
end
