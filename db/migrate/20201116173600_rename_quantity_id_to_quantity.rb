class RenameQuantityIdToQuantity < ActiveRecord::Migration[6.0]
  def change
    rename_column :carted_products, :quantity_id, :quantity
  end
end
