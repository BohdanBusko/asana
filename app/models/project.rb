class Project < ApplicationRecord
  belongs_to :user
  has_many :sections
  validates :name, length: { maximum: 250 }, presence: true
end
