class AddLicensedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :licensed, :string
  end
end
