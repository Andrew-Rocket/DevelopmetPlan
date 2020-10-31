require 'rails_helper'

describe UsersController, type: :controller do

  before(:each) do
    sign_in(create :user)
  end

  describe '#index' do
    let!(:user) { create :user }

    before(:each) do
      get :index
    end

    it 'returns all users' do
      expect(assigns(:users)).to eq(User.all)
    end

    it 'renders index' do
      expect(response).to render_template(:index)
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

  end

  describe '#show' do
    let!(:user) { create :user }

    before(:each) do
      get :show, params: {id: user}
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders show' do
      expect(response).to render_template(:show)
    end

    it 'returns user object' do
      expect(assigns(:user)).to eq(user)
    end
  end
end


