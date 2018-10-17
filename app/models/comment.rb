class Comment < ApplicationRecord
  belongs_to :user, :task
end
