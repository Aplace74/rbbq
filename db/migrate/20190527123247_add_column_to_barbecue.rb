class AddColumnToBarbecue < ActiveRecord::Migration[5.2]
  def change
    add_column :barbecues, :capacity, :integer
    add_column :barbecues, :type, :string
  end
end
