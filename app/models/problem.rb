class Problem < ApplicationRecord
	attr_accessor :problems_attributes
  belongs_to :quiz, optional: true
  has_many :solutions, dependent: :destroy
  accepts_nested_attributes_for :solutions, allow_destroy: true
end
