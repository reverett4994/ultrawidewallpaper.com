class AddTitle < ActiveRecord::Migration
  def change
  	add_column :wallpapers,:title,:string
  end
end
