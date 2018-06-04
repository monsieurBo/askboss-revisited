class Quiz < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
  has_many :solutions, through: :problems, dependent: :destroy
  accepts_nested_attributes_for :problems
  

  acts_as_taggable
end
