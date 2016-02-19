

require 'rails_helper'

describe Friending do

  let( :friending ) { build( :friending ) }

  it "creates valid friending with default params" do
    expect( friending ).to be_valid
  end

  it "does not create friending without initiator" do
    expect( build( :friending, initiator: nil)).to_not be_valid
  end

  it "does not create friending without recipient" do
    expect( build( :friending, recipient: nil)).to_not be_valid
  end

end
