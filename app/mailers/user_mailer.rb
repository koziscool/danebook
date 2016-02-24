class UserMailer < ApplicationMailer

  default :from => "the_happy_people@danebook.com"

  def welcome(user)
    @user = user
    mail(to: @user.email , subject: 'Welcome to Danebook')
  end

end
