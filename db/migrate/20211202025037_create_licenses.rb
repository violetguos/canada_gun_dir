class CreateLicenses < ActiveRecord::Migration[6.1]
  def change
    create_table :licenses do |t|
      t.boolean :restricted

      t.timestamps
    end
  end
end
