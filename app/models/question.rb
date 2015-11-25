class Question < ActiveRecord::Base

  #dont order by created_at, as it is not indexed by default, use id instead which has a clustered index
  default_scope {order("questions.id DESC")}

  belongs_to :user
  belongs_to :user_restricted, :select => "users.id, users.email", :class_name => "User"
  validates_presence_of :ques
  validates_presence_of :user
end
