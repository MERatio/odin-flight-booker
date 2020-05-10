class FlightsController < ApplicationController
  def index
    @flights = Flight.upcoming.paginate(page: params[:page])
    if params[:search]
      @departure = params[:search][:departure_id]
      @arrival = params[:search][:arrival_id]
      @num_of_tickets = params[:search][:num_of_tickets]
      @departure_date = params[:search][:departure_date]
      @flights = Flight.search(@departure, @arrival, @departure_date)
                       .paginate(page: params[:page])
    end
  end
end
