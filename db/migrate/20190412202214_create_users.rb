class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :nick
      t.integer :phone
      t.string :email
      t.string :country
      t.string :city
      t.string :image
      t.boolean :admin
      t.boolean :superadmin
      t.boolean :blacklist
      t.boolean :banned
      t.boolean :deleted

      t.timestamps
    end
  end
end
