class UserMailer < ActionMailer::Base
  default from: "spuri3@ncsu.edu"

  def welcome_mailer(user)
    @user = user
    @url  = 'http://152.46.16.234/login'
    mail(to: @user.email, subject: 'Welcome to Direwolf -> Worlds No1 Job Site')
  end
end
