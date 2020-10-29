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

  describe '#invite' do

    let(:params) do
      {user: {first_name: 'test', last_name: 'test', email: 'lol', level: :middle, department_id: 1}}
    end

    # before(:each) do
    #   {method: :post, action: :invite, params: {user: User.new(params)}}
    # end


    it 'creates a new user' do
      expect {
        post :invite, params: params
      }.to change(User, :count).by(1)
    end

    # and / or
    #
    # it 'assigns a new Post' do
    #   post :create, valid_params
    #   assigns(:post).should be_a(Post)
    #   assigns(:post).should be_persisted
    # end

    #=
    # it 'returns invited user' do
    #   expect(assigns(:user)).to be(User.first.update(response.params))
    # end
    #
    # it 'renders show' do
    #   expect(response).to render_template(:index)
    # end
    #
    # it 'returns status 200' do
    #   expect(response).to have_http_status(200)
    # end
  end
end

