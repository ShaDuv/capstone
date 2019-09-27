class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics, id: false, primary_key: :site_id do |t|
      t.string :name
      t.primary_key :site_id
      t.timestamps
    end
  end
end
