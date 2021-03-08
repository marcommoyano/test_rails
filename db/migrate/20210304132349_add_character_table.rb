class AddCharacterTable < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :color
      t.references :user, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true

      t.timestamps
    end
  end
end
