class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :title
      t.string :kind
      t.text :content
      t.string :user_id

      t.timestamps
    end
  end
end
