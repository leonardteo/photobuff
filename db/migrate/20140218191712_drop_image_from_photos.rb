class DropImageFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :image
    remove_column :photos, :thumbnail
  end
end
