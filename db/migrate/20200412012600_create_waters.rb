class CreateWaters < ActiveRecord::Migration[6.0]
  def change
    create_table :waters do |t|
      t.string :feeling
      t.integer :intensity

      t.timestamps
    end
  end
end
