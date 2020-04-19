class Project < ApplicationRecord
  has_many :tickets, dependent: :destroy
  # has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5 }
end
