class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :Title
      t.text :Text
      t.text :CommentsCounter
      t.text :LikesCounter
      t.references :Author, foregin_key: { to_table: 'users' }, index: true

      t.timestamps
    end
  end
end
