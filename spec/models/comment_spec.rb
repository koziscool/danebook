

require 'rails_helper'

describe Comment do

  let( :comment ) { create(:comment) }
  let(:user) do
   create(:user)
   comment.author_id = user.id
   user
  end

   it "has associated author" do
    expect( comment.author ).to_not( eq(nil) )
  end

  it "has associated body" do
    expect( comment.body ).to_not eq(nil)
  end


end