class CreateWallpapers < ActiveRecord::Migration
  def change
    create_table :wallpapers do |t|
      t.string :cat
      t.string :color
      t.integer :picture_id

      t.timestamps null: false
    end
  end
end
