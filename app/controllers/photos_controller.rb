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
    if @photo.save
      redirect_to photos_path, :notice => "Your Photo has been added to the gallery"
    else
      render new_photo_path
    end
  end

  def update
   @photo = Photo.find(params[:id])
   begin
   if @photo.update!(photo_params)
     redirect_to photo_path, :notice => "Your Photo Post has been updated"
   else
     render "edit"
   end
  rescue
    redirect_to edit_photo_path
  end

 end

  private
    def photo_params
      params.require(:photo).permit(:title, :user, :category_id,:image)
    end

end
