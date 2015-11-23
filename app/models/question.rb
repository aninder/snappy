class Question < ActiveRecord::Base
  default_scope {order("ques DESC")}

  belongs_to :user
  validates_presence_of :ques
end
