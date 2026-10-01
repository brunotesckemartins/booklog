class Item < ApplicationRecord
  belongs_to :user
  belongs_to :collection, optional: true

  enum :item_type, { manga: 0, hq: 1, livro: 2 }
  enum :status, { quero_ler: 0, lendo: 1, lido: 2 }

  has_rich_text :review

  validates :title, presence: true
  validates :item_type, presence: true
  validates :status, presence: true

  before_create :generate_public_token

  private

  def generate_public_token
    self.public_token = SecureRandom.urlsafe_base64(12)
  end
end