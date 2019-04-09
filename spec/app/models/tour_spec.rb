require "rails_helper"

RSpec.describe Tour, type: :model do
  let!(:admin) {User.create(role: "admin", email: "test@gmail.com", password: "123")}
  let!(:tour1) {Tour.create(title: "test1", description: "Lorem ipsum...", category: "Туры по Украине", duration: "Карпаты", price: 100, user_id: "#{admin[:id]}")}
  let!(:tour2) {Tour.create(title: "test2", description: "Lorem ipsum...", category: "Туры по Европе", duration: "Каменец", price: 200, user_id: "#{admin[:id]}")}
  let!(:tour3) {Tour.create(title: "test3", description: "Lorem ipsum...", category: "Туры по Европе", duration: "Каменец", price: 200, user_id: "#{admin[:id]}")}

  describe "#tours" do
    context "should have a users method" do
      it {expect(tour1.user_id).to eq(admin.id)}
    end
  end

  describe "#title" do
    context "should return valid" do
      it {expect(tour1.title?).to eq(true)}
      it {expect(Tour.create(title: "").valid?).to eq(false)}
    end
  end

  describe "#category" do
    context "should return valid" do
      it {expect(tour1.category?).to eq(true)}
      it {expect(Tour.create(category: "").valid?).to eq(false)}
    end
  end

  describe "#DURATION" do
    context "should return array of durations" do
      it {expect(Tour.pluck(:duration).uniq.sort).to eq(["Каменец","Карпаты"])}
    end
  end

  describe "#by_duration" do
    context "should return tour with duration" do
      it {expect(Tour.by_duration("Каменец")).to include(tour2)}
      it {expect(Tour.by_duration("Каменец")).not_to include(tour1)}
    end
  end

  describe "#by_title" do
    context "should return tour with title" do
      it {expect(Tour.by_title("test1")).to include(tour1)}
      it {expect(Tour.by_title("test1")).not_to include(tour2)}
    end
  end

  describe "#by_price" do
    context "should return tour with price" do
      it {expect(Tour.by_price(50,150)).to include(tour1)}
      it {expect(Tour.by_price(50,150)).not_to include(tour2)}
    end
  end

  describe "#by_ukrainian_tours" do
    context "should return ukrainian tour" do
      it {expect(Tour.by_ukrainian_tours).to include(tour1)}
      it {expect(Tour.by_ukrainian_tours).not_to include(tour2)}
    end
  end

  describe "#by_european_tours" do
    context "should return european tour" do
      it {expect(Tour.by_european_tours).to include(tour2)}
      it {expect(Tour.by_european_tours).not_to include(tour1)}
    end
  end
end