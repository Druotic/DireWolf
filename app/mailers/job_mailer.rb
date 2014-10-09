class JobMailer < ActionMailer::Base
  default from: "spuri3@ncsu.edu"

  def application_conformation(job, user)
    @user = user
    @job = job
    @url  = 'http://152.46.16.234/login'
    mail(to: @user.email, subject: 'Application Successful')
  end
end
