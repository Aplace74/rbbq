class CreateBarbecues < ActiveRecord::Migration[5.2]
  def change
    create_table :barbecues do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :pictures
      t.string :model
      t.float :price
      t.references :user, foreign_key: true
      t.boolean :free

      t.timestamps
    end
  end
end
