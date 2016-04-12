class AddIsFeaturedToSpreeTaxons < ActiveRecord::Migration
  def change

    add_column :spree_taxons, :is_featured, :boolean, default: false

  end
end
