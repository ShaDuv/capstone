class AddForeignKeyForData < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :data, :topics
  end
end
