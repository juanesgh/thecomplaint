class CreateUserLikePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_like_posts do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :like

      t.timestamps
    end
  end
end
