class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  delegate :category, to: :product
  delegate :name, to: :product, prefix: :product

end
