class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :image
      t.string :location
      t.boolean :solved
      t.boolean :open
      t.boolean :dumpster
      t.boolean :deleted

      t.timestamps
    end
  end
end
