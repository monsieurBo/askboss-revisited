class Problem < ApplicationRecord
  belongs_to :quiz
  has_many :solutions, dependent: :destroy
end
