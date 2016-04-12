module Spree
  HomeController.class_eval do

    alias_method :orig_index, :index

    def index
      @featured_taxons = Spree::Taxon.where(is_featured: true).includes(:products)
      @products = Spree::Product.joins(:taxons).where({ spree_taxons: { id: @featured_taxons } }).page(params[:page])
    end

  end
end
