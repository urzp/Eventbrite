class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @event = current_user.events.build
    end
  end
end
