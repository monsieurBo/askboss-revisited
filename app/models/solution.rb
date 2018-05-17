class Solution < ApplicationRecord
  belongs_to :problem, dependent: :destroy
end
