class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  # def create
  #   @bookmark = Bookmark.new(bookmark_params)
  #   @bookmark.list = @list
  #   if @bookmark.save
  #     redirect_to list_path(@list)
  #   else
  #     render :new, status: :unprocessable_entity
  #     flash[:notice] = @bookmark.errors.full_messages.to_sentence
  #   end
  # end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    flash[:notice] = @bookmark.errors.full_messages.to_sentence unless @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark.destroy
    redirect_to lists_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
