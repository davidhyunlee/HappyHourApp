class HoursController < ApplicationController
  def index
  end

  def create
    # render plain: params

    @hour = Hour.new(hour_params)
    @hour.business_id = params[:business_id]

    if @hour.save
      flash[:success] = "You've successfully added your business hours."
      redirect_to('/')
    else
      flash[:failure] = "Something went wrong. Your business hours weren't created."
      redirect_to('/')
    end
  end

  def update
    business = Business.find(params[:id])
    @hour = Hour.find_by_business_id(business.id)

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
