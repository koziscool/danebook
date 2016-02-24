module UsersHelper

  def has_already_friended( user1, user2 )
    user1.friends_initiated.exists?( user2 )
  end

  def photo_image_tag( user )
    if user.avatar 
       "<%= image_tag @user.avatar.photo_info.url(:medium) %>"
    else
        "<img id=\"profile-pic\"  src=\"/assets/harry_potter_small.jpg\" class=\"navbar-form\" alt=\"Responsive Cover\">"
    end


  end 
end
