class CreateConnectionsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.references :user, foreign_key: true
      t.references :buddy
      t.timestamps null: false
    end

    add_foreign_key :connections, :users, column: :buddy_id
  end
end
