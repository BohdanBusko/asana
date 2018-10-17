class Section < ApplicationRecord
  has_many :tasks
  belongs_to :project

  validates :name, length: { maximum: 250 }, presence: true
end
