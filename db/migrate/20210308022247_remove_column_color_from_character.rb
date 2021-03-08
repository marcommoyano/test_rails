class RemoveColumnColorFromCharacter < ActiveRecord::Migration[6.0]
  def change
    remove_column :characters, :color
  end
end
