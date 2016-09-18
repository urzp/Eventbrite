class Event < ActiveRecord::Base
  has_many :join_tables, :foreign_key => :event_id, :class_name => "EventUser"
  has_many :guests, :through => :join_tables, :source => :event_user

  belongs_to :owner, :class_name => "User"

  def future?
    self.date >= Date.today
  end

  def past?
    self.date < Date.today
  end
end
