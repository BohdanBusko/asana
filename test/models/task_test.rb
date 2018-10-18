# == Schema Information
#
# Table name: tasks
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :text
#  section_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
