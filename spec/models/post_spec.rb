

require 'rails_helper'

describe Post do

  let( :post ) { build( :post ) }

  it "is valid with default attributes" do
    expect( post ).to be_valid
  end

  it "is not valid without author" do 
    expect( create(post, author_id: nil)).to raise_error
  end

  it "is not valid without body" do 
    expect( create(post, body: nil)).to_not be_valid
  end

end

