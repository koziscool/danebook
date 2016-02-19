

require 'rails_helper'

describe Like do

  let( :like ) { build( :like ) }
  let(:user) { create( :user ) }

  it "creates valid like with default params" do
    expect( create( :like ) ).to be_valid
  end

  it "does not create like without author" do
    expect( build( :like, author: nil) ).to_not be_valid
  end

end