class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    
    @list_of_photos = matching_photos.order({ :username => :desc})
    
    render({ :template => "photo_templates/index" })
  end

  def show
    
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })
    
    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show" })
    
  end

  def baii
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })
    
    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ :template => "photo_templates/baii" })

    redirect_to("/photos")

  end

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    if a_new_photo.save
      redirect_to("/photos/" + a_new_photo.id.to_s)
    else
      # Log the errors to see why it failed
      logger.debug a_new_photo.errors.full_messages
      flash[:error] = a_new_photo.errors.full_messages.to_sentence
      redirect_to("/photos")
    end
  end
end
