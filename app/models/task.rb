class Task < ApplicationRecord
  belongs_to :section

  validates :title, length: { maximum: 250 }, presence: true
  validates :description, length: { maximum: 250 }, presence: true
end
