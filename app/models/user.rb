class User < ActiveRecord::Base
  has_secure_password
  has_many :questions, dependent: :nullify
  # has_many :other_user_questions, class_name: "Question", conditions: proc {["user_id != ?", self.id]}

  validates :name,
            uniqueness: {case_sensitive: false},
            presence: true,
            length: {minimum:3, maximum: 25},
            format: /\A[a-zA-Z_0-9]+\Z/

  validates :password, on:[:create],
            length: {minimum: 3, maximum: 11, msg:"passwors must be between 3 and 10 characters"}

   end
