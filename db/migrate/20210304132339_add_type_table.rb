class AddTypeTable < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :name

      t.timestamps
    end
  end
end
