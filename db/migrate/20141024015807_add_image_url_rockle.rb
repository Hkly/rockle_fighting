class AddImageUrlRockle < ActiveRecord::Migration
  def change
    add_column :rockles, :image_url, :string
  end
end
