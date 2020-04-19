class Ticket < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :body, presence: true
  validates :status, presence: true
end
