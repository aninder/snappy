class Question < ActiveRecord::Base
  default_scope {order("created_at DESC")}

  belongs_to :user
  validates_presence_of :ques
  validates_presence_of :user
end
