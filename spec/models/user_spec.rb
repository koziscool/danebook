

require 'rails_helper'

describe User do

  let( :user ) { build(profile) }

  #  do 
  #   build(:user) 
  #   user.profile = build(profile)
  # end

  let(:duplicate_email) do
    create(:duplicate_email)
    build(:duplicate_email)
  end


  xit "is valid with default attributes" do
    expect( user ).to be_valid
  end

  xit "has default first_name jim" do
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

  context "user profiles" do

    xit "is valid with default params" do
      expect( user.profile ).to be_valid
    end

    xit "is reciprocal/inverser" do
      expect( user.profile.user ).to eq(user)
    end

    xit "has associated birthday" do
      expect( profile.birthday ).to_not eq(nil)
    end

    xit "has associated sex" do
      expect( profile.gender).to_not eq(nil)
    end

    xit "destroying a user destroys the profile" do
      user.save
      expect{ user.destroy }.to change{ Profile.count }.by(-1)
    end
  end



end