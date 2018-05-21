class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :votes, dependent: :destroy

  acts_as_taggable
end
