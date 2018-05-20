class User < ApplicationRecord
	
  include Clearance::User
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :flash_cards
  has_many :notes
  
  include Clearance::User
end

