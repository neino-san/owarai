class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content
      t.text :profile
      t.string :user_id

      t.timestamps
    end
  end
end