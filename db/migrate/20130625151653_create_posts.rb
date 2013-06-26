class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.string :email
      t.integer :category_id
      t.timestamps
    end

  create_table :categories do |t|
    t.string :title
    t.string :description
    t.timestamps
    end
  end
end
