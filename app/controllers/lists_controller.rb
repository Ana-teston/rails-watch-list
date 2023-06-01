class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit]

  def index
    @lists = List.all
    @list = List.new
    @movies = Movie.all
    @bookmarks = Bookmark.where(list_id: @lists.pluck(:id))
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list), notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
