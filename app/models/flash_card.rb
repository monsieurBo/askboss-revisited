class Flash_card < ApplicationRecord
	belongs_to :user, index:true
	has_many :cards
end
	