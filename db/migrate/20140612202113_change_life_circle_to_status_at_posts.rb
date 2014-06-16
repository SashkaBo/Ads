class ChangeLifeCircleToStatusAtPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :life_circle
    add_column :posts, :status, :string
  end
end
