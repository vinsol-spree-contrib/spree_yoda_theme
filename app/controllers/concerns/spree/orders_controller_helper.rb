module Spree
  module OrdersControllerHelper

    PRODUCTS_LIMIT = 3

    def edit
      super
      @taxon ||= Spree::Taxon.find_by(name: 'Categories')
      classifications_id = Spree::Classification.where(taxon_id: @taxon.self_and_descendants.pluck(:id)).pluck(:product_id)
      @products = Spree::Product.where(id: classifications_id).limit(PRODUCTS_LIMIT) if @order.line_items.empty?
    end
  end
end
