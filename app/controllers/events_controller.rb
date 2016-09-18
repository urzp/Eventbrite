class EventsController < ApplicationController

    def index
      @events_past = Event.all.select{|ev_i| ev_i.past?}
      @events_future = Event.all.select{|ev_i| ev_i.future?}
    end

    def create
      @event = current_user.events.build(evevt_params)
      if @event.save
        flash[:success] = "Event created!"
        redirect_to root_url
      else
        redirect_to root_url
      end
    end

    def show
    end

    def destroy
    end

    private

    def evevt_params
      params.require(:event).permit(:name, :date, :location)
    end

end
