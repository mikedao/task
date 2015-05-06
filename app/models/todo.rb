class Todo < ActiveRecord::Base
  after_create :check_mail
  after_update :send_update
  belongs_to :list


  private

  def check_mail
    array = self.title.split(' ')
    if array[-2] == "/cc"
      self.email = array[-1]
      self.save
      puts "SENDING MAIL"
      Usermailer.new_task(self).deliver_now
    end
  end

  def send_update
    if self.email
      puts "SENDING MAIL"
      Usermailer.updated_task(self).deliver_now
    end
  end
end
