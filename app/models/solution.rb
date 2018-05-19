class Solution < ApplicationRecord
  belongs_to :problem, dependent: :destroy, optional: true
end
