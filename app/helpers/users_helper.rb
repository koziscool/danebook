module UsersHelper

  def has_already_friended( user1, user2 )
    user1.friends_initiated.exists?( user2 )
  end
end
