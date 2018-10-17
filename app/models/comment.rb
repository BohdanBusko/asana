class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :project
  
  validates :text, length: { maximum: 250 }, presence: true
end
