
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
end