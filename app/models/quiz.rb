class Quiz < ApplicationRecord
  belongs_to :user
  has_many :problems, dependent: :destroy
  accepts_nested_attributes_for :problems
end
