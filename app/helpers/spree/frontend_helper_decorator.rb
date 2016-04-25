module Spree
  FrontendHelper.class_eval do
    def cart_info(text = nil)
      css_class = nil

      if simple_current_order.nil? or simple_current_order.item_count.zero?
        text = "<span class='glyphicon glyphicon-shopping-cart'></span> 0"
        css_class = 'empty'
      else
        text = "<span class='glyphicon glyphicon-shopping-cart'></span> #{simple_current_order.item_count}"
        css_class = 'full'
      end

      text.html_safe
    end

    def first_level_taxons(taxon)
      taxon.children.where(depth: 1)
    end

    def fetch_products_count_by_taxon(taxon)
      Spree::Classification.where(taxon_id: taxon.self_and_descendants.pluck(:id)).count
    end

    def cache_key_for_taxons
      max_updated_at = @taxons.maximum(:updated_at).to_i
      parts = [@taxon.try(:id), max_updated_at].compact.join("-")
      "#{I18n.locale}/taxons/#{parts}/#{Spree::Config[:theme_name]}"
    end
  end
end
