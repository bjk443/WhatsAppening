class VenuesController < ApplicationController
  before_action :check_owner, only: [:edit]

  def index
    latitude = request.location.latitude || 1.3059422
    longitude = request.location.longitude || 103.8301194
    @search_query = params.dig(:search, :category)
    if @search_query.nil? || @search_query.empty?
      @venues = Venue.near([latitude, longitude], 5)
      @venues_cafe = @venues.select {|x|x.category == "cafe"}
      @venues_bar = @venues.select {|x|x.category == "bar"}
    else
      @category_of_venues = Venue.search_by_category(@search_query)
      @venues_search = @category_of_venues.near([latitude, longitude], 5)
      @venues_search_waiting = @venues_search.sort_by {|x| x.events.last.waiting_time_to_integer}
      # raise
      @markers = @venues_search.map do |venue|
        {
          lat: venue.latitude,
          lng: venue.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { venue: venue })
        }
      end
    end
  end

  def show
    # call Deezer ->
    # get the info
    base_url = "https://api.deezer.com/playlist/"
    @venue = Venue.find(params[:id])
    current_user_name = current_user.name
    flash.now[:notice] = "Hi #{current_user.name ? current_user_name.capitalize : current_user.email}" + ", Welcome to #{@venue.name}"
    # @venue_playlist_info
    @playlist_data = HTTParty.get(base_url + @venue.events.first.playlist_id)
    @chatroom = @venue.chatroom
    @message = Message.new
    @rating = Rating.new
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
