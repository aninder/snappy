class AddConstraintsToUsers < ActiveRecord::Migration
  def up
    change_column :users, :name, :string, limit:40, null:false
    change_column :users, :password_digest, :string, null:false

    # add_foreign_key :questions, :users, on_delete: :nullify
  end

  def down
    change_column :users, :name, :string, limit:40, null:true
    change_column :users, :password_digest, :string, null:true

    # remove_foreign_key :questions, :users
  end
end
