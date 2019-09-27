class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_site_id
      t.integer :age
      t.string :gender
      t.string :minor_location
      t.string :major_location
      t.string :role
      t.string :action
      


      t.timestamps
    end
  end
end
