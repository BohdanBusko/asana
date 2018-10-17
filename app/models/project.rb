class Project < ApplicationRecord
  has_many :sections
  belongs_to :user
  
  validates :name, length: { maximum: 250 }, presence: true
end
