class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  validates :name,
            uniqueness: {case_sensitive: false},
            presence: true,
            length: {minimum:3, maximum: 25},
            format: /[a-zA-Z_0-9]/

  validates :password,
            length: {minimum: 3, maximum: 10}

   end
