class ChangeQuantityToDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :doses, :quantity, :description
  end
end
