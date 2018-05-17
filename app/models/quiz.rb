class Quiz < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
end
