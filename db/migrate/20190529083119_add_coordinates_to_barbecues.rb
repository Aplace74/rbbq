class AddCoordinatesToBarbecues < ActiveRecord::Migration[5.2]
  def change
    add_column :barbecues, :latitude, :float
    add_column :barbecues, :longitude, :float
  end
end
