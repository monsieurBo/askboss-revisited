class User < ApplicationRecord
	attr_accessor :libraries
  include Clearance::User
  has_many :questions
  has_many :answers
  has_many :votes
  mount_uploaders :libraries, LibraryUploader
  include Clearance::User
end

