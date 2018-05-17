class Vote < ApplicationRecord
	belongs_to :user
	belongs_to :question, optional: true, dependent: :destroy
	belongs_to :answer, optional: true, :dependent => :destroy
end
