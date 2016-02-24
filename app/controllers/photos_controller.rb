class PhotosController < ApplicationController

  before_action :require_login

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new( photo_params )
    if @photo.save
      current_user.avatar = @photo
      flash[:success] = "You've successfuly uploaded a photo!"
      redirect_to user_path(current_user)
    else
      flash[:error] = "It failed to upload photo"
      render :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:photo_info)
  end

end
