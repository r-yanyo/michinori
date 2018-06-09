class AddColumnToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :likeNum, :integer
  end
end
