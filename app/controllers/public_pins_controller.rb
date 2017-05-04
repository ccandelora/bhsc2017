class PublicPinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]


  def index
    @public_pins = PublicPin.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @public_pin = current_user.public_pins.build
  end

  def edit
  end

  def create
    @public_pin = current_user.public_pins.build(public_pin_params)
    if @public_pin.save
      redirect_to @public_pin, notice: 'Public Pin was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @public_pin.update(public_pin_params)
      redirect_to @public_pin, notice: 'Public Pin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @public_pin.destroy
    redirect_to public_pins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_pin
      @public_pin = PublicPin.find(params[:id])
    end

    def correct_user
      @public_pin = current_user.public_pins.find_by(id: params[:id])
      redirect_to public_pins_path, notice: 'Not authorized to edit this pin' if @public_pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_pin_params
      params.require(:public_pin).permit(:description, :image)
    end
end
