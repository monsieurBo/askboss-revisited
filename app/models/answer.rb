class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, :dependent => :destroy
  has_many :votes, :dependent => :destroy
end
