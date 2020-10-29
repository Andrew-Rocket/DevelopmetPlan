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

  describe '#new' do

    before(:each) do
      get :new
    end

    it 'returns new user' do
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders new' do
      expect(response).to render_template(:new)
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

  end

  describe '#show' do

    before(:each) do
      get :show, params: {id: User.first.id}
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders show' do
      expect(response).to render_template(:show)
    end

    it 'returns user object' do
      expect(assigns(:user)).to eq(User.first)
    end
  end
end


