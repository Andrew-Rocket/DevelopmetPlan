# frozen_string_literal: true

require 'rails_helper'

describe DepartmentsController, type: :controller do
  before(:each) do
    sign_in(create(:user))
  end

  describe '#index' do
    let!(:department) { create :department }

    before(:each) do
      get :index
    end

    it 'returns all deps' do
      expect(assigns(:departments)).to eq(Department.all)
    end

    it 'renders index' do
      expect(response).to render_template(:index)
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe '#show' do
    let!(:department) { create :department }

    before(:each) do
      get :show, params: { id: department.id }
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders show' do
      expect(response).to render_template(:show)
    end

    it 'returns department object' do
      expect(assigns(:department)).to eq(department)
    end
  end

  describe '#new' do
    before(:each) do
      get :new
    end

    it 'returns new user' do
      expect(assigns(:department)).to be_a_new(Department)
    end

    it 'renders new' do
      expect(response).to render_template(:new)
    end

    it 'returns status code200' do
      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    let!(:params) { { department: { title: 'test' } } }

    it 'creates a new department' do
      expect do
        post :create, params: params
      end.to change(Department, :count).by(1)
    end

    it 'assigns a new department' do
      post :create, params: params
      assigns(:department).should be_a(Department)
      assigns(:department).should be_persisted
    end
  end

  describe '#edit' do
    let!(:department) { create :department }

    before(:each) do
      get :edit, params: { id: department.id }
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders edit' do
      expect(response).to render_template(:edit)
    end

    it 'returns department object' do
      expect(assigns(:department)).to eq(department)
    end
  end

  describe '#update' do
    let!(:department) { create :department }

    let(:attr) do
      { title: 'new title' }
    end

    before(:each) do
      put :update, params: { id: department.id, department: attr }
      department.reload
    end

    it { expect(response).to redirect_to(department) }
    it { expect(department.title).to eql attr[:title] }
  end

  describe '#destroy' do
    let!(:department) { create :department }

    it 'deletes department' do
      expect do
        delete :destroy, params: { id: department.id }
      end.to change(Department, :count).by(-1)
    end
  end
end
