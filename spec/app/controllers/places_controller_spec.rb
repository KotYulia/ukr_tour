require "rails_helper"

RSpec.describe PlacesController, type: :controller do
  let(:place) {Place.create(id: 1, title: "Title", description: "Description", image: "/uploads/place/image/1/7188231e-a180-43fc-ba23-be653906259c__1.jpg")}


  describe 'GET index' do
    before do
      place
      get :index
    end

    context 'should return all places when place is present' do
      #it {expect(assigns(:places)).to include(place)}
    end

    context 'when place is not present' do
      #it {expect(assigns(:places)).not_to include(nil)}
    end
  end
end