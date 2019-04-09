require "rails_helper"
require "pry"

RSpec.describe ToursController, type: :controller do
  let(:admin) {User.create(role: "admin", email: "test10@gmail.com", password: "123", password_confirmation: "123",
                          first_name: "Test", last_name: "Name", city: "Cherkassy", avatar: "")}
  let(:tour) {Tour.create(user_id: admin.id, title: "test1", description: "Lorem ipsum...",
                          category: "Туры по Украине", duration: "Карпаты", price: 100)}
  let(:tour1) {Tour.create(user_id: admin.id, title: "test2", description: "Lorem ipsum...",
                          category: "Туры по Украине", duration: "Карпаты", price: 300)}
  let(:tour_params) { tour_params = { user_id: admin.id, title: "test1", description: "Lorem ipsum...",
                                      category: "Туры по Европе", duration: "Карпаты", price: 100} }
  let(:tour_invalid_params) { tour_params = { user_id: "", title: "", category: ""} }
  let(:search_params) { { title: "test", duration: "Карпаты", min_price: 90, max_price: 200} }

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


  describe 'GET show' do
    before do
      tour
      get :show, params: {id: tour.id}
    end

    context 'when params id is present' do
      it {expect(assigns(:tour)).to eq tour}
    end

    context 'when params id is not present' do
      it {expect(assigns(:tour)).not_to eq nil}
    end
  end

  describe 'GET new' do
    before do
      get :new
    end
    context 'should assign the tour' do
      it {expect(assigns(:tour)).to be_a_new(Tour)}
    end

    context 'should return http success' do
      it {expect(response).to have_http_status(:success)}
    end
  end

  describe 'POST create' do
    context 'when params is valid' do
      it do
        expect{
          post :create, params: {tour: tour_params}
        }.to change(Tour, :count).by(1)
      end
    end

    context 'should assign a newly created tour' do
      before do
        post :create, params: { tour: tour_params }
      end

      it do
        expect(assigns(:tour)).to be_a(Tour)
        expect(assigns(:tour)).to be_persisted
      end
    end

    context 'when params is invalid' do
      before do
        post :create, params: { tour: tour_invalid_params }
      end

      it 'should render new' do
        expect(response).to render_template(:new)
      end
    end

    context 'when params is invalid' do
      it do
        expect{
          post :create, params: {tour: tour_invalid_params}
        }.not_to change(Tour, :count)
      end
    end
  end

  describe 'GET edit' do
    before do
      tour
      get :edit, params: { id: tour.id }
    end

    context 'should assign a tour' do
      it do
        expect(assigns(:tour)).to eq(tour)
      end
    end

    context 'should return http success' do
      it do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PUT update' do
    before do
      put :update, params: {id: tour.id, tour: tour_params}
    end

    context 'when params is valid' do
      it "should update the tour" do
        tour.reload

        expect(tour.title).to  eq(tour_params[:title])
      end

      it 'should redirect to tours page' do
        expect(response).to redirect_to(tour_path(tour))
      end
    end

    context 'when params is invalid' do
      it 'does not change tour' do
        expect do
          put :update, params: { id: tour.id, tour: tour_invalid_params }
        end.not_to change { tour.reload.title }
      end
    end
  end

  describe 'DELETE destroy' do
    before {tour}
    context 'should destroy the requested select_option' do
      it do
        expect{
          delete :destroy, params: {id: tour.id}
        }.to change(Tour, :count).by(-1)
      end
    end

    context 'should redirect to tours_path' do
      before do
        delete :destroy, params: {id: tour.id}
      end
      it do
        expect(response).to redirect_to tours_path
      end
    end
  end
end