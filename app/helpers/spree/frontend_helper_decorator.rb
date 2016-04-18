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

    def taxons_header(root_taxon, current_taxon, max_level = 1, child_node = false)
      return '' if max_level < 1 || root_taxon.leaf?
      options = {}

      taxons = root_taxon.children.map do |taxon|
        options = { class: 'col-sm-1', data: { 'show-taxon': true } }
        options[:class] += ' dropdown-menu' if child_node
        content_tag :ul, options do
          css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'active' : ''
          link_options = { class: "#{ css_class } dropdown-toggle", data: { toggle: 'dropdown' } }
          link_to(taxon.name, seo_url(taxon), link_options) + taxons_header(taxon, current_taxon, max_level - 1, true)
        end
      end
      safe_join(taxons, "\n")
    end
  end
end
