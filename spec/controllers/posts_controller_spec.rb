require 'rails_helper'

describe PostsController do

  describe "#create" do

    let(:user) { create(:user) }
    let(:new_post) { create(:post, author: user) }
  
    before do
      user
      new_post
      request.cookies[:auth_token] = user.auth_token
    end

    it "successful create redirects back" do
      post :create, :post => attributes_for( :post )
      expect(response).to redirect_to( user_timeline_path(user) )
    end
  end

  describe "#destroy" do

  end


end