class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :user_id, null: false
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamp   null: false
    end
  end
end
