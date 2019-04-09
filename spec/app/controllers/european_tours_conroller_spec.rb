require "rails_helper"
require "pry"

RSpec.describe ToursController, type: :controller do
  let(:admin) {User.create(role: "admin", email: "test10@gmail.com", password: "123", password_confirmation: "123",
                           first_name: "Test", last_name: "Name", city: "Cherkassy", avatar: "")}
  let(:tour) {Tour.create(user_id: admin.id, title: "test1", description: "Lorem ipsum...",
                          category: "Туры по Европе", duration: "Карпаты", price: 100)}
  let(:tour1) {Tour.create(user_id: admin.id, title: "test2", description: "Lorem ipsum...",
                           category: "Туры по Украине", duration: "Карпаты", price: 300)}
  let(:search_params) { { category: "Туры по Европе", title: "test", duration: "Карпаты", min_price: 90, max_price: 200} }

  before{allow(controller).to receive(:current_user) {admin}}

  describe 'GET index' do
    before do
      tour
      tour1
      get :index, params: search_params
    end

    context 'should return all tours when tour is present' do
      it {expect(assigns(:tours_all)).to include(tour)}
    end

    context 'when tour is not present' do
      it {expect(assigns(:tours_all)).not_to include(nil)}
    end

    context 'when search params is present' do
      it {expect(assigns(:tours)).to include(tour)}
      it {expect(assigns(:tours)).not_to include(tour1)}
      it {expect(response).to have_http_status(:success)}
    end
  end
end