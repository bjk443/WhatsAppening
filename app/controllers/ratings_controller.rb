class RatingsController < ApplicationController
before_action :find_event, except: [:destroy] #will not find event that does not exist
    def new
        @rating = rating.new
    end

    def edit
        @rating = rating.find(params[:id])
    end

    def create
        @rating = rating.new(rating_params)
        @rating.save
        @rating.event = @event
        if @rating.save
        redirect_to event_path(@event)
        else
        render :new #renders instance of new that failed to save (still in /ratings)
        end
    end

    def update
        @rating = rating.find(params[:id])
        @rating.update(rating_params)
        redirect_to event_path(@rating)
    end

    def destroy
        @rating = rating.find(params[:id])
        @rating.destroy!
        redirect_to event_path(@rating.event) #go back to event
    end

    private

    def find_event
        @event = event.find(params[:event_id])
    end

    def rating_params
        params.require(:rating).permit(:content, :rating)
    end
end

  