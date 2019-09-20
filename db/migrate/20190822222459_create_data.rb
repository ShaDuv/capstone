class CreateData < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.integer :age
      t.string :gender
      t.string :minor_location
      t.string :major_location
      t.string :role
      t.string :action
      t.string :user_site_id
      
      t.timestamps
    end
  end
end
