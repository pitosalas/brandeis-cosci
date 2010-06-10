class TracksController < ApplicationController
  def show
    @track = Track.find(params[:id])
  end

  def index
    @tracks = Track.find(:all)
  end
  
  def edit
    @track = Track.find(params[:id])
  end
  
  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(params[:track])
      flash[:notice] = 'Medium was successfully updated.'
        redirect_to(@track)
      else
        render :action => "edit" 
      end
  end
end
