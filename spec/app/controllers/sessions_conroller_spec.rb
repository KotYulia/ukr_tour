require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  let(:user) {User.create(email: "test10@gmail.com", password: "123", password_confirmation: "123",
                          first_name: "Test", last_name: "Name", city: "Cherkassy", avatar: "")}
  let(:admin) {User.create(role: "admin", email: "test@gmail.com", password: "123")}
  let(:admin_params) { { email: "test@gmail.com", password: "123"} }
  let(:user_params) { { email: "test10@gmail.com", password: "123"} }
  let(:user_invalid_params) { user_params = { email: "test", password: "", password_confirmation: "123"} }


  describe 'POST create' do
    context 'when user is admin' do
      before do
        admin
        post :create, params: admin_params
      end
      it 'should redirect to admin dashboard' do
        expect(response).to redirect_to(admin_root_path)
      end
    end

    context 'when user is standard' do
      before do
        user
        post :create, params: user_params
      end
      it 'should redirect to user profile' do
        expect(response).to redirect_to(user_path(user))
      end
    end


    context 'when params is invalid' do
      before do
        post :create, params: { user: user_invalid_params }
      end

      it 'should render new' do
        expect(response).to render_template(:new)
      end
    end


  end
end