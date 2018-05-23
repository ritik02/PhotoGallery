class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    begin
      @photo.save!
      redirect_to photos_path, :notice => "Your Photo has been added to the gallery"
    rescue
      @photo.destroy
      @photo.image.purge_later
      redirect_to new_photo_path
    end
  end

  def update
   @photo = Photo.find(params[:id])
   begin
    @photo.update!(photo_params)
    redirect_to photo_path, :notice => "Your Photo Post has been updated"
  rescue
    redirect_to edit_photo_path
  end
 end


  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path, :notice => "Your Photo has been removed from the gallery"
  end

  private
    def photo_params
      params.require(:photo).permit(:title, :user, :category_id, :image)
    end

end
