class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  validates_presence_of :name, :description
  delegate :vechicle, :computer, to: :products

  scope :vehicle, -> { where(type: 'vehicle') }
  scope :computer, -> { where(type: 'computer') }

  def self.search_by_name(search_term)
    return [] if search_term.blank?
    where("name LIKE ?", "%#{ search_term }%").order("created_at DESC")
  end

  def self.types
    %w(Vehicle, Computer)
  end
end

