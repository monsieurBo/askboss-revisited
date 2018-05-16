class User < ApplicationRecord
  include Clearance::User
  has_many :questions
  has_many :answers
  has_many :votes

  include Clearance::User
end

