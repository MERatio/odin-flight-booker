class PassengerMailer < ApplicationMailer
  def thank_you_email
    @passenger = params[:passenger]
    @url = booking_url(@passenger.booking)
    mail(to: @passenger.email, subject: 'You have booked your ticket with Odin Flight')
  end
end
