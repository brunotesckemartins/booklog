class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :collections, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end