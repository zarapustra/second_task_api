class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.integer :released
      t.boolean :available
      t.timestamps
    end
  end
end

