class Section < ApplicationRecord
  belongs_to :project
  has_many :tasks
  validates :name, length: { maximum: 250 }, presence: true
end
