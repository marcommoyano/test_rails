class AddColorTable < ActiveRecord::Migration[6.0]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :color

      t.timestamps
    end

    add_reference :characters, :color, index: true
  end
end
