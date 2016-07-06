require 'rails_helper'

describe Category do
  it { should have_many(:products) }
  it { should validate_presence_of(:name) }

  describe "#recent_products" do
    it "return the products the reverse order by created at"
    it "return all the videos if there are less than 6 products"
    it "return 6 products if there are more than 6 products"
    it "return the most recent 6 vidoes"
    it "return an empty array if the category does not have any videos"
  end
end
