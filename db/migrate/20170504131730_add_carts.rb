class AddCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts, id: :uuid
  end
end
