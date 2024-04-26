class AddParentPostToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :parent_post, null: false, foreign_key: {to_table: :posts}
  end
end
