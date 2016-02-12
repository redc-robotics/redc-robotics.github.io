class ProfilePicturesController < ApplicationController
  def new
    @profile_picture = ProfilePicture.new
  end

  def create
    @profile_picture = ProfilePicture.new()
    if current_user && @profile_picture.update_attributes(user_id: current_user.id, image: params[:profile_picture][:image])
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  private
  def picture_params
    params.require(:profile_picture).permit(:image)
  end
end
