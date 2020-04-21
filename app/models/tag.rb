class Tag < ApplicationRecord
  has_many :ticket_tags
  has_many :tickets, through: :ticket_tags

  validates :name, presence: true

  scope :alphabetical, -> { order("lower(tags.name) ASC") }
end
