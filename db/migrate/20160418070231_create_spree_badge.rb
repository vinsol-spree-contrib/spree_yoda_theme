class CreateSpreeBadge < ActiveRecord::Migration
  def change
    create_table :spree_badges do |t|

      t.string :name

      t.timestamps
    end
  end
end
