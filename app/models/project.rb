class Project < ApplicationRecord
  has_many :comments, dependent: :destroy

  enum status: %i[backlog planning ready_to_dev in_progress review qa ready_to_deploy done]

  validates :name, presence: true
  validates :status, presence: true
end
