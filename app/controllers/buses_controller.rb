class BusesController < ApplicationController
  def index
    if params.has_key?(:day) && params.has_key?(:month) && params.has_key?(:year)
      if params[:from_busport_id].blank?
        flash.now[:alert] = "Departure busport is missing"
      elsif params[:to_busport_id].blank?
        flash.now[:alert] = "Destination busport is missing"
      elsif params[:pax].blank?
        flash.now[:alert] = "Please choose the number of passengers"
      elsif params[:from_busport_id] == params[:to_busport_id]
        flash.now[:alert] = "Please check your input"
      else
        @selected_date = Date.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
        @available_trips = Bus.where(from_busport_id: params[:from_busport_id], to_busport_id: params[:to_busport_id], scheduled_on: @selected_date.all_day)
      end
    end
  end

  private
  def bus_params
    params.require(:bus).permit(:from_busport_id, :to_busport_id, :duration, :scheduled_on)
  end
end
