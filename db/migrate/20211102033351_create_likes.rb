class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.index [:post_id, :user_id], unique: true
    end
  end
end
