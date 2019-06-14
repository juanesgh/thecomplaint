class CreatePostFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_flags do |t|
      t.integer :post_id
      t.integer :user_id
      t.text :comment
      t.string :category

      t.timestamps
    end
  end
end
