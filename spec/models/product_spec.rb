require 'rails_helper'

describe Product  do
  it { should belong_to(:category) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  
  describe "search_by_title" do
    it "returns an empty array if there is on match"
    it "returns an array of one video for an exact match"
    it "returns an array of one video for a partial match"
    it "returns an array of all matches ordered by created_at"
  end
end
