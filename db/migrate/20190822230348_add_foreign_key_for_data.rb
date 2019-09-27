class AddForeignKeyForData < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :topic_id, :integer
    add_foreign_key :profiles, :topics, index: true
  end
end
