
require 'rails_helper.rb'

describe UsersController do


  describe "POST #create" do

    it "successful create redirects to user show page" do
      #attributes_for is FactoryGirl method
      post :create, :user => attributes_for( :user )
      expect(response).to redirect_to user_path( assigns(:user) )
    end

    it "unsuccessful create renders user new page" do
      #attributes_for is FactoryGirl method
      post :create, :user => attributes_for( :user_with_no_password )
      expect(response).to render_template(:new)
    end

  end

  describe "Logged In User" do

    let(:user) { create(:user) }
    let(:user_2) { create(:user) }

    before :each do
      request.cookies["auth_token"] = user.auth_token
    end

    it "can GET request to #edit" do
      #first hash is params hash, second options hash is sessions hash
      get :edit, { id: user.id }, { user_id: user.id }
      expect(response).to render_template( :edit )
    end

    it "tries to GET request another user's #edit but cannot" do
      user_2
      get :edit, { id: user_2.id }, { user_id: user.id }
      expect(response).to redirect_to( root_path )
    end

    it "can PATCH request to #update" do
      patch :update, { id: user.id, user: { name: "ASDF" } }, { user_id: user.id }
      expect(response).to redirect_to redirect_to user_path( assigns(:user) )
    end

    it "bad params to PATCH request to #update redirects to edit" do
      patch :update, { id: user.id, user: { email: "" } }, { user_id: user.id }
      expect(response).to render_template( :edit )
    end

    it "can GET request to #timeline" do
      get :timeline, { user_id: user.id }, { user_id: user.id }
      expect(response).to render_template( :timeline )
    end

    it "can GET request to #friends" do
      get :friends, { user_id: user.id }, { user_id: user.id }
      expect(response).to render_template( :friends )
    end

    it "can GET request to #photos" do
      get :photos, { user_id: user.id }, { user_id: user.id }
      expect(response).to render_template( :photos )
    end
  end
  
end






