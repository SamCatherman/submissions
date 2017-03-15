class Submission < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :body, presence: true
  belongs_to :user
end
