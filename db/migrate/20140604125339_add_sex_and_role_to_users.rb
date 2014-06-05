class AddSexAndRoleToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :sex
      t.string :role
    end
  end
end
