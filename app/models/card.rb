class Card < ApplicationRecord
	belongs_to :flash_card
	has_one :question
	has_one :answer
end
	