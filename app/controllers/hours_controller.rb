class HoursController < ApplicationController
  def update
    business = Business.find(params[:business_id])
    @hour = business.hour

    if @hour.update_attributes(hour_params)
      redirect_to('/')
    else
      redirect_to('google.com')
    end
  end

  def hour_params
    params.require(:hour).permit(:mon_open, :tue_open, :wed_open, :thu_open, :fri_open, :sat_open, :sun_open, :mon_close, :tue_close, :wed_close, :thu_close, :fri_close, :sat_close, :sun_close, :mon_start, :tue_start, :wed_start, :thu_start, :fri_start, :sat_start, :sun_start, :mon_end, :tue_end, :wed_end, :thu_end, :fri_end, :sat_end, :sun_end, :business_id)
  end

end
