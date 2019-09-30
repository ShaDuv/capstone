class AddForeignKeyForData < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :topic_id, :integer
    add_foreign_key :profiles, :topics, primary_key: :site_id, index: true
  end
end
