class Category < ApplicationRecord
  has_many :products, -> { order "created_at DESC" }
  validates_presence_of :name

  def recent_porducts
    products.first(6)
  end
end
