module FlightsHelper
  def pick_flight_validation
    if (params[:flight_id].nil? || params[:num_of_tickets].nil?)
      if params[:flight_id].nil?
        flash[:danger] = 'Please pick a flight first'
      elsif params[:num_of_tickets].nil?
        flash[:danger] = 'Please specify the number of tickets'
      end
      redirect_to root_path
      return
    end
  end
end
