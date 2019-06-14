class CreateUserTags < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tags do |t|
      t.integer :user_id
      t.references :comment_id, foreign_key: true

      t.timestamps
    end
  end
end
