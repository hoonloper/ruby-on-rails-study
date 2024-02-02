class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :user_id

      add_index :posts, :title, name: 'posts_title_index', order: { title: desc }

      t.timestamps
    end
  end
end
