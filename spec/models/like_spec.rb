

require 'rails_helper'

describe Like do

  let( :like ) { build( :like ) }
  let(:user) { create( :user ) }

  it "does not create like without author" do
    expect( create( like ) ).to_not be_valid
  end

  it "does not create like without author" do
    expect( create( like, author: user) ).to be_valid
  end

end