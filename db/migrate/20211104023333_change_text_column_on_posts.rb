class ChangeTextColumnOnPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :text, false
  end
end
