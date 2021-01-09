class AddImageToBeers < ActiveRecord::Migration[6.0]
  def change
    add_column :beers, :image, :string
  end
end
