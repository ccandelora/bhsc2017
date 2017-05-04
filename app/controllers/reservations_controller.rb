class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  before_filter :require_login

  # GET /reservations
  def index
    @reservations = Reservation.first
  end

  def pick
    #@reservations = Reservation.all
    @reservations = current_user.reservations.where("reservation_date >= ?", Date.today).order("reservation_date ASC")
  end

  def lookup
    @reservations = Reservation.all.where("reservation_date = ?", reservation_params[:reservation_date]).order("id ASC")
    get_reservation_week_detail
  end

  # GET /reservations/1
  def show
  end

  # GET /reservations/new
  def new
    @reservation = current_user.reservations.build
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  def create
    @reservation = current_user.reservations.build(reservation_params)
    if !reservation_params[:reservation_date].empty?
      @reservation.reservation_week_id = get_reservation_week.id
    end

    if @reservation.save
      redirect_to @reservation, notice: 'Reservation was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: 'Reservation was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /reservations/1
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def get_reservation_week
      if !reservation_params[:reservation_date].empty?
        resdate = reservation_params[:reservation_date]
        @res = ReservationWeek.find_by_res_date(resdate)

        if !@res
          @res = ReservationWeek.create(res_date: resdate)
        end

        @res
      end
    end

    def get_reservation_week_detail
      resdate = reservation_params[:reservation_date]
      @reservation_week = ReservationWeek.find_by_res_date(resdate)
      @reservation_week
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:reservation_date, :name, :wed, :thur, :fri, :sat, :sun, :mon, :tue, :dinner, :comment, :sex, :res_member_type, :user_id)
    end

    def require_login
      unless current_user
        redirect_to new_user_session_url
      end
    end
end
