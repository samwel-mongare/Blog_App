class ChangeDataTypesInPostsTable < ActiveRecord::Migration[7.0]
  change_table :posts do |t|
    t.change :comments_counter, :bigint
    t.change :likes_counter, :bigint
  end
end
