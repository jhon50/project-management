class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :description, presence: true
  validates :project_id, presence: true
  validates :user_id, presence: true
end
