class ReservationWeeksController < ApplicationController
  before_action :set_reservation_week, only: [:show, :edit, :update, :destroy]

  before_filter :require_login

  # GET /reservation_weeks
  # GET /reservation_weeks.json
  def index
    @reservation_weeks = ReservationWeek.all
  end

  # GET /reservation_weeks/1
  # GET /reservation_weeks/1.json
  def show
  end

  def pick
    @reservation_weeks = ReservationWeek.all.where("res_date >= ?", Date.today).order("res_date ASC")
  end

  # GET /reservation_weeks/new
  def new
    @reservation_week = ReservationWeek.new
  end

  # GET /reservation_weeks/1/edit
  def edit
  end

  # POST /reservation_weeks
  # POST /reservation_weeks.json
  def create
    if !find_reservation_week_detail.nil?
      respond_to do |format|
        format.html { redirect_to edit_reservation_week_path(@reservation_week) }
      end
    else
      @reservation_week = ReservationWeek.new(reservation_week_params)
      respond_to do |format|
        if @reservation_week.save
          format.html { redirect_to @reservation_week, notice: 'Reservation week was successfully created.' }
          format.json { render action: 'show', status: :created, location: @reservation_week }
        else
          format.html { render action: 'new' }
          format.json { render json: @reservation_week.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /reservation_weeks/1
  # PATCH/PUT /reservation_weeks/1.json
  def update
    respond_to do |format|
      if @reservation_week.update(reservation_week_params)
        format.html { redirect_to @reservation_week, notice: 'Reservation week was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reservation_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservation_weeks/1
  # DELETE /reservation_weeks/1.json
  def destroy
    @reservation_week.destroy
    respond_to do |format|
      format.html { redirect_to reservation_weeks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_week
      @reservation_week = ReservationWeek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_week_params
      params.require(:reservation_week).permit(:res_date, :note)
    end

    def find_reservation_week_detail
      @reservation_week = ReservationWeek.find_by_res_date(reservation_week_params[:res_date])
      @reservation_week
    end

    def require_login
      unless current_user
        redirect_to new_user_session_url
      end
    end
end
