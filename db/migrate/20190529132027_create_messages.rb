class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :sender, foreign_key: true
      t.references :receiver, foreign_key: true
      t.text :content
    end
  end
end
