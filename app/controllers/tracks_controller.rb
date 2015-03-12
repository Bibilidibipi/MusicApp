class TracksController < ApplicationController
  def new
    @album = Album.new
    render :new
  end

  def create
    @track = track.new(track_params)

    if @track.save
      flash[:notice] = ["Track created"]
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
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
      flash[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy!
    flash[:notice] = ["Track destroyed"]
    redirect_to :back
  end

  private

  def track_params
    params.require(:track).permit(:name, :bonus, :album_id, :lyrics)
  end
end
