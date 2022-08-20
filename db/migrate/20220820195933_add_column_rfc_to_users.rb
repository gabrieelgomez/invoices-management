class AddColumnRfcToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :rfc, :string
  end
end
