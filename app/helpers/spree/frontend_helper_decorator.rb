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

    def product_taxons_tree(root_taxon, current_taxon, max_level = 1)
      return '' if max_level < 1 || root_taxon.leaf?
      content_tag :div, class: 'list-group' do
        taxons = root_taxon.children.map do |taxon|
          if fetch_products_with_product(taxon) > 0
            css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'list-group-item active' : 'list-group-item'
            link_to(taxon.name, seo_url(taxon), class: css_class) + product_taxons_tree(taxon, current_taxon, max_level - 1)
          end
        end
        safe_join(taxons, "\n")
      end
    end

    def fetch_products_with_product(taxon)
      Spree::Classification.where(taxon_id: taxon.self_and_descendants.pluck(:id)).count
    end
  end
end
