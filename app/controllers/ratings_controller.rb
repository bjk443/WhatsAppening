class RatingsController < ApplicationController
before_action :find_event, except: [:destroy] #will not find event that does not exist
    def new
        @rating = Rating.new
    end

    def edit
        @rating = Rating.find(params[:id])
    end

    def create
        @rating = Rating.new(rating_params)
        @event = @rating.event 
        if @rating.save
        redirect_to event_path(@event)
        else
        render :new #renders instance of new that failed to save (still in /ratings)
        end
    end

    private

    def find_event
        @event = Event.find(params[:event_id])
    end

    def rating_params
        params.require(:rating).permit(:stars, :waiting_time, :crowd_level)
    end
end

  