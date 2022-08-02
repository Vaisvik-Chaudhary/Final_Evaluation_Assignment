class AddRefToNominees < ActiveRecord::Migration[7.0]
  def change
    add_reference :nominees, :account, null: false, foreign_key: true
    add_reference :nominees, :user, null: false, foreign_key: true
  end
end
