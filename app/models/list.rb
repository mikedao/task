class List < ActiveRecord::Base
  after_create :make_active

  def self.active
    where(active: true)
  end

  def self.inactive
    where(active: false)
  end

  def make_active
    self.active = true
    self.save
  end
end
