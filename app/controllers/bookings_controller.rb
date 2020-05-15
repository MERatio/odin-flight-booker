class BookingsController < ApplicationController
  include FlightsHelper

  def new
    pick_flight_validation
    @flight         = Flight.find_by(id: params[:flight_id])
    @num_of_tickets = params[:num_of_tickets].to_i
    @booking        = Booking.new
    @num_of_tickets.times { @booking.passengers.build }
  end

  def create
    flight  = Flight.find_by(id: params[:booking][:flight_id])
    @booking = Booking.new(booking_params)

    if @booking.save
      send_thank_you_email(@booking.passengers)
      flash[:success] = 'Successfully booked a flight'
      redirect_to @booking
    else
      flash[:danger] = "Something went wrong please check your input if it's valid"
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    unless @booking
      flash[:danger] = 'Booking not found'
      redirect_to root_url
    end
    @flight = @booking.flight
    @num_of_tickets = @booking.num_of_tickets
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, :num_of_tickets,
                                      passengers_attributes: [:id, :name, :email])
    end

    def send_thank_you_email(passengers)
      passengers.each do |passenger|
        PassengerMailer.with(passenger: passenger).thank_you_email.deliver_now
      end
    end
end
