class BookmarksController < ApplicationController

  def new
    # we are identifying the nested route which is list/1/bookmark/new,
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new
    if @bookmark.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end

  end

private
def bookmark_params
  params.require(:bookmark).permit(:comment, :movie)
end


end
