class TracksController < ApplicationController
  before_action :ensure_login

  def new
    @track = Track.new(album_id: params[:album_id])
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      flash[:notice] = ["Track created"]
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      @album = Album.new
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      flash[:notice] = ["Track edited"]
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      @album = Album.new
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @album = @track.album
    @track.destroy!
    flash[:notice] = ["Track destroyed"]
    redirect_to album_url(@album)
  end

  private

  def track_params
    params.require(:track).permit(:name, :bonus, :album_id, :lyrics)
  end
end
