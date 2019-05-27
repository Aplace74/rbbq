class AddRatingToBarbecues < ActiveRecord::Migration[5.2]
  def change
    add_column :barbecues, :rating, :integer
  end
end
