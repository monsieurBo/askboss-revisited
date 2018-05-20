class User < ApplicationRecord
	
  include Clearance::User
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :flash_cards
  has_many :notes
  has_many :quizzes
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following
  include Clearance::User
end

