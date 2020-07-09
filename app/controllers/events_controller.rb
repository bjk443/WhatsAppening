class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :check_owner, only: [:edit]

  def index
    search_query = params.dig(:search, :address)
    if search_query.nil? || search_query.empty?
      @events = Event.all
    else
      @events = Event.near(search_query, 2)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @venue = Venue.find(params[:venue_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save
    # redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    # redirect_to event_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    # redirect_to account_my_listings_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :address, :capacity, :event_rating)
  end

  def check_owner
    if current_user == Event.find(params[:id]).user
    else
      redirect_to root_path, alert: "You got no permission to edit the page"
    end
  end
end
