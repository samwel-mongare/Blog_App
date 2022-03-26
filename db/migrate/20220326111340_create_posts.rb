class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :AuthorId
      t.string :Title
      t.text :Text
      t.text :CommentsCounter
      t.text :LikesCounter
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :posts, [:user_id], :unique: true
  end
end
