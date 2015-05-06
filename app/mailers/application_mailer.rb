class ApplicationMailer < ActionMailer::Base
  default from: "michael.dao@gmail.com"
  layout 'mailer'

  def new_task(todo)
    @todo = todo
    mail(to: @todo.email, subject:"Youve been CCed on a task")
  end
end
