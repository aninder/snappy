class AddConstraintsToQuestions < ActiveRecord::Migration
  def up
    change_column :questions, :ques, :string, limit:40, null:false
    change_column :questions, :user_id, :integer, null:false
  end

  def down
    change_column :questions, :ques, :string, limit:40, null:true
    change_column :questions, :user_id, :integer, null:true
  end

end
