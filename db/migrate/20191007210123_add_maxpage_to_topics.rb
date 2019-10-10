class AddMaxpageToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :maxpage, :integer
  end
end
