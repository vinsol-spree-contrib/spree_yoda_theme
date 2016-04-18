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

    def taxons_header(root_taxon, current_taxon, max_level = 1)
      return '' if max_level < 1 || root_taxon.leaf?
      content_tag :ul, class: 'list-group-item', data: { 'taxon-level': root_taxon.id } do
        taxons = root_taxon.children.map do |taxon|
          css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'list-group-item active' : 'list-group-item'
          link_to(taxon.name, seo_url(taxon), class: css_class, data: { 'taxon-root': taxon.id }) + taxons_header(taxon, current_taxon, max_level - 1)
        end
        safe_join(taxons, "\n")
      end
    end
  end
end
