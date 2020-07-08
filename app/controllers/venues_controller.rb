class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :check_owner, only: [:edit]

  def index
    search_query = params.dig(:search, :address)
    if search_query.nil? || search_query.empty?
      @venues = Venue.all
    else
      @venues = Venue.near(search_query, 2)
    end
  end

  def show
    @venue = Venue.find(params[:id])
    # session[:stored_url] = request.url
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user_id = current_user.id
    @venue.save
    # redirect_to venue_path(@venue)
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    # redirect_to venue_path
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    # redirect_to account_my_listings_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :description, :address, :capacity, :venue_rating)
  end

  def check_owner
    if current_user == Venue.find(params[:id]).user
    else
      redirect_to root_path, alert: "You got no permission to edit the page"
    end
  end
end
