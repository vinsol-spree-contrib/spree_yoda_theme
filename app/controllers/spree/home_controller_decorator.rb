module Spree
  HomeController.class_eval do

    include ProductRetriever
    alias_method :orig_index, :index

    def index
      @featured_taxons = Spree::Taxon.where(is_featured: true).includes(:products)
    end
  end
end
