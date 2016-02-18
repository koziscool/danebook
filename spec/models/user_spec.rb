

require 'rails_helper'

describe User do

  let( :user ) { build(:user) }

  let(:duplicate_email) do
    create(:duplicate_email)
    build(:duplicate_email)
  end


  it "is valid with default attributes" do
    expect( user ).to be_valid
  end

  it "has default first_name jim" do
    expect( user.first_name ).to eq("jim")
  end


  it "does not save without password" do 
    expect{ create(:user, password: "") }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it "does not validate user with no email" do
    expect( build(:user, email: "") ).to_not be_valid
  end

  it "does not validate user with duplicate email" do
    expect(duplicate_email).to_not be_valid
  end

end