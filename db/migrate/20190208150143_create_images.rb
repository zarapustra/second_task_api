class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.references :product
      t.references :device
    end
  end
end
