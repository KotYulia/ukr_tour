require "rails_helper"

RSpec.describe Place, type: :model do
  let!(:place) { Place.create(title: "Title", description: "Description", image: "image_path") }

  describe "#title" do
    context "should return valid" do
      it {expect(place.title?).to eq(true)}
      it {expect(Place.create(title: "").valid?).to eq(false)}
    end
  end

  describe "#description" do
    context "should return valid" do
      it {expect(place.description?).to eq(true)}
      it {expect(Place.create(description: "").valid?).to eq(false)}
    end
  end
end