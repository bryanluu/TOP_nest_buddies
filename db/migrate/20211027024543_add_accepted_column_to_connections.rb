class AddAcceptedColumnToConnections < ActiveRecord::Migration[6.1]
  def change
    add_column :connections, :accepted, :boolean, default: false
  end
end
