# require 'rails_helper'
#
# describe DepartmentsController, type: :controller do
#
#   RSpec.describe "Post", :type => :request do
#     describe '#create' do
#       it "creates a Post and redirects to the Post's page" do
#         get "/posts/new"
#         expect(response).to render_template(:new)
#
#         ### This is where the error is happening. On the `post` method.
#         post "/posts", :post => {:title => "My Post", :content => "My post content"}
#
#         expect(response).to redirect_to(assigns(:post))
#         follow_redirect!
#
#         expect(response).to render_template(:show)
#         expect(response.body).to include("Post was successfully created.")
#       end
#
#       it "does not render a different template" do
#         get "/posts/new"
#         expect(response).to_not render_template(:show)
#       end
#     end
#   end