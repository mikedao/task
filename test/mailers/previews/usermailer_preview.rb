# Preview all emails at http://localhost:3000/rails/mailers/usermailer
class UsermailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/usermailer/new_task
  def new_task
    Usermailer.new_task
  end

  # Preview this email at http://localhost:3000/rails/mailers/usermailer/updated_task
  def updated_task
    Usermailer.updated_task
  end

end
