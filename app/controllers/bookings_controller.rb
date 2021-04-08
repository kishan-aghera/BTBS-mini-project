class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @selected_bus = Bus.find(params[:bus])
    @passengers_count = params[:pax].to_i
    @passengers_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = 'Booking successfully completed!'
      redirect_to booking_path(@booking)
    # else
    #   flash[:alert] = 'An error occured!'
    #   # binding.pry
    #   redirect_to new_booking_path(bus: params["booking"]["bus_id"], pax: params["booking"]["passengers_attributes"].keys.length)
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:bus_id, passengers_attributes: [:name, :email])
  end
end
