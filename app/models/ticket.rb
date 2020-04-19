class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags

  validates :name, presence: true
  validates :body, presence: true
  validates :status, presence: true
  validates :assignee, presence: true
end
