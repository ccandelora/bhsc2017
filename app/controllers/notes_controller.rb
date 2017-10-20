class NotesController < ApplicationController
  before_action :authenticate_user!

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to pick_notes_path, notice: 'Reservation was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to pick_notes_path, notice: 'Page was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

  def index
    @notes = Note.all.order(:order)
  end

  def show
  end

  def pick
    @notes = Note.all.order(:order)
  end

  private
  def note_params
    params.require(:note).permit(:title, :message, :description, :order)
  end
end
