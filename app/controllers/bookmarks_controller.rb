class BookmarksController < ApplicationController
  before_action :find_list, only: [:new, :create, :destroy]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render 'new'
    end
  end
  @
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list # Assuming the association is named "list"

    @bookmark.destroy

    redirect_to list_path(@list), notice: 'Bookmark was successfully removed.'
  end


  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:boorkmark_id, :movie_id, :comment)
  end
end
