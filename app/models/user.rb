class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  validates :name,
            uniqueness: {case_sensitive: false},
            presence: true,
            length: {minimum:3, maximum: 25},
            format: /\A[a-zA-Z_0-9]+\Z/

  validates :password,
            length: {minimum: 3, maximum: 10}

   end
