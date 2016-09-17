class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  def upcoming_events
    self.attended_events.select{|ev| ev.data >= Date.today}
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  validates :name,  presence: true
  validates :email, presence: true
  validates :name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    has_many :events,  :foreign_key => "owner_id", :class_name => "Event"

    has_many :attended_events, :through => :join_tables, :source => :user_event
    has_many :join_tables,  :foreign_key => :user_id, :class_name => "EventUser"

private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
