class BandsController < ApplicationController
  def new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      flash[:notice] = ["Band created"]
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def index
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      flash[:notice] = ["Band edited"]
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy!
    flash[:notice] = ["Band destroyed"]
    redirect_to :back
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
