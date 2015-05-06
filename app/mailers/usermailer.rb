class Usermailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usermailer.new_task.subject
  #
  def new_task(todo)
    @greeting = "Hi"
    mail(to: todo.email) do |format|
      format.text
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usermailer.updated_task.subject
  #
  def updated_task(todo)
    @greeting = "Hi"

    mail(to: todo.email) do |format|
      format.text
    end
  end
end
