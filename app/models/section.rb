# == Schema Information
#
# Table name: sections
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Section < ApplicationRecord
  has_many :tasks
  belongs_to :project

  validates :name, length: { maximum: 250 }, presence: true
end
