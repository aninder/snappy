class User < ActiveRecord::Base
  has_secure_password
  validates :name,
            uniqueness: {case_sensitive: false},
            presence: true,
            length: {minimum:3, maximum: 10},
            format: /[a-zA-Z_0-9]/

  validates :password,
            length: {minimum: 3, maximum: 10}

   end
