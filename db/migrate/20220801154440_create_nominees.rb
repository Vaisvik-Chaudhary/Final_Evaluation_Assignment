class CreateNominees < ActiveRecord::Migration[7.0]
  def change
    create_table :nominees do |t|
      t.string :nominee_name
      t.integer :percentage

      t.timestamps
    end
  end
end
