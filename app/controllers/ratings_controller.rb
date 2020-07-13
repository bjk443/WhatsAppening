class RatingsController < ApplicationController
before_action :find_event, except: [:destroy] #will not find event that does not exist
    def new
        @event = Event.find(params[:event_id])
        @rating = Rating.new
    end

    def edit
        @rating = Rating.find(params[:id])
    end

    def create
        rating_params
        @rating = Rating.new(stars: params[:stars],
                             crowd_level: params[:crowd_level],
                             waiting_time: params[:waiting_time]
                             )
        @event = Event.find(params[:event_id])
        @rating.event = @event
        @venue = @event.venue
        @rating.user = current_user
        if @rating.save
          flash[:notice] = "Thanks for your real-time review!"
          redirect_to venue_path(@venue)
        else
        render :new #renders instance of new that failed to save (still in /ratings)
        end
    end

    private

    def find_event
        @event = Event.find(params[:event_id])
    end

    def rating_params
        params.permit!
    end
end

  