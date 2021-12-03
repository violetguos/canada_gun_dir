class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :reddit_username
      t.string :club
      t.string :greater_region
      t.string :specific_city
      t.string :province
      t.text :notes

      t.timestamps
    end
  end
end
