class EventsController < ApplicationController
    def create
      @event = current_user.events.build(evevt_params)
      if @event.save
        flash[:success] = "Event created!"

      else
        
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
