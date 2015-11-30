class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates_presence_of :user
  validates_presence_of :question
  validates_presence_of :ans,
                        presence: true,
                        length: {minimum: 3, maximum: 150},
                        format: /\A[a-zA-Z_0-9]+\Z/
end
