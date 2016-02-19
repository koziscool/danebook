

require 'rails_helper'

describe Comment do

  let( :comment ) { create(:comment) }
  let(:user) do
   create(:user)
   comment.author_id = user.id
   user
  end

  it "it is valid with default params" do
    expect( build( :comment ) ).to be_valid
  end

  it "it not valid without author" do
    expect( build( :comment, author: nil ) ).to_not be_valid
  end

  it "has associated author" do
    expect( comment.author ).to_not( eq(nil) )
  end

  it "has associated body" do
    expect( comment.body ).to_not eq(nil)
  end


end