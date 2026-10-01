class Collection < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :nullify

  validates :title, presence: true
end