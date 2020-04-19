class Ticket < ApplicationRecord
  belongs_to :project
  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags

  validates :name, presence: true
  validates :body, presence: true
  validates :status, presence: true
end
