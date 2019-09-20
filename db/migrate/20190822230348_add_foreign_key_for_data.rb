class AddForeignKeyForData < ActiveRecord::Migration[5.2]
  def change
    add_column :data, :topic_id, :integer
    add_foreign_key :data, :topics, index: true
  end
end
