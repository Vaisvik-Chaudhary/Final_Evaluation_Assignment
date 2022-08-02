class AddUserRefToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :user, null: false, foreign_key: true
    add_column :accounts, :balance, :integer, default: 1000, null: false
  end
end
