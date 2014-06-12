class AddTypeAndLifeCircleToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.integer :type_id
      t.string :life_circle
    end
  end
end
