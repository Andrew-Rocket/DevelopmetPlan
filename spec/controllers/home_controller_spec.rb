# frozen_string_literal: true

require 'rails_helper'

describe HomeController, type: :controller do
  before(:each) do
    sign_in(create(:user))
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
