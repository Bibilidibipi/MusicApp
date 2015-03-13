class AlbumsController < ApplicationController
  before_action :ensure_login

  def new
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      flash[:notice] = ["Album created"]
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      @band = Band.new
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      flash[:notice] = ["Album edited"]
      redirect_to album_url(@album)
    else
      flash.new[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @band = @album.band
    @album.destroy!
    flash[:notice] = ["Album destroyed"]
    redirect_to bands_url(@band)
  end

  private

  def album_params
    params.require(:album).permit(:name, :recording_type, :band_id)
  end
end
