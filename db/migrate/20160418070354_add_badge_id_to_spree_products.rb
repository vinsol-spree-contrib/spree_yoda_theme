class AddBadgeIdToSpreeProducts < ActiveRecord::Migration
  def change

    add_column :spree_products, :badge_id, :integer, index: true

  end
end
