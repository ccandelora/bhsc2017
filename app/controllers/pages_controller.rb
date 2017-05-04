class PagesController < ApplicationController

  def index
    @pages = Page.all
  end

  def home
  end

  def contact
  end

  def guest
     @page = Page.find(4)
  end

  def library
  end

  def membership
    @page = Page.find(1)
  end

  def note
  end

  def race
     @page = Page.find(2)
  end

  def social
     @page = Page.find(3)
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pages/1
  def update
    @page = Page.find(params[:id])
    @pages = Page.all
    if @page.update(page_params)
      redirect_to @pages, notice: 'Page was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /page/1
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :text)
  end

end
