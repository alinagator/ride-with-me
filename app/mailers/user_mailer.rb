class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Ride With Me')
  end

  # def foobar_email(user)
  #   @user = user
  #   mail(to: @user.email, subject: 'Foo bar')
  # end

end