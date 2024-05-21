class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    
    @list_of_photos = matching_photos.order({ :username => :desc})
    
    render({ :template => "photo_templates/index" })
  end
end

