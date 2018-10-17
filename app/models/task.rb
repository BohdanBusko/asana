class Task < ApplicationRecord
  belongs_to :section
  has_many :comments
  validates :title, length: { maximum: 250 }, presence: true
  validates :description, length: { maximum: 250 }, presence: true
end
