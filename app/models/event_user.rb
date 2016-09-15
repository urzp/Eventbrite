class EventUser < ActiveRecord::Base
  belongs_to :event_user, :foreign_key => "user_id", :class_name => "User"
  belongs_to :user_event, :foreign_key => "event_id",:class_name => "Event"
end
