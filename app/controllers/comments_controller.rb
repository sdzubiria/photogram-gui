class CommentsController < ApplicationController
  def create
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_comment = params.fetch("input_comment")

    new_comment = Comment.new
    new_comment.photo_id = input_photo_id
    new_comment.author_id = input_author_id
    new_comment.body = input_comment

    if new_comment.save
      redirect_to("/photos/#{input_photo_id}")
    else
      redirect_to("/photos/#{input_photo_id}", alert: "Error adding comment.")
    end
  end
end

