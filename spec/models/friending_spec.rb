

require 'rails_helper'

describe Like do

  let( :friending ) { create( :friending ) }

  it "does not create like without author" do
    expect( create(friending, initiator: nil)).to_not be_valid
  end

  it "does not create like without birthday" do
    expect( create(friending, recipient: nil)).to_not be_valid
  end

end
