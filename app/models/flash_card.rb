class FlashCard < ApplicationRecord
	belongs_to :user
	has_many :cards, dependent: :destroy
  accepts_nested_attributes_for :cards

  acts_as_taggable
end
	