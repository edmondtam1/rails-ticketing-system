class Ticket < ApplicationRecord
  STATUSES = ["new", "blocked", "in_progress", "fixed"]

  belongs_to :project
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments

  validates :name, presence: true
  validates :body, presence: true
  validates :status, inclusion: { in: STATUSES }

  scope :open, -> { where("status != ?", "fixed") }
end
