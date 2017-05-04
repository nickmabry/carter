class AddItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items, id: :uuid do |t|
      t.string :cart_id, null: false
      t.string :external_id, null: false
      t.string :name
      t.integer :value
    end

    add_index :items, [:cart_id, :external_id], unique: true
  end
end
