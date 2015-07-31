class AlbumsController < ApplicationController
  before_action(:fetch_artist)

  def index
    @albums = @artist.albums
    respond_with(@artist, @albums)
  end

  def show
    @album = @artist.albums.find(params[:id])
    respond_with(@artist, @album)
  end

  def new
    @album = @artist.albums.new
    respond_with(@artist, @album)
  end

  def create
    @album = @artist.albums.new(album_params)
    @album.save
    respond_with(@artist, @album)
  end

  def edit
    @album = @artist.albums.find(params[:id])
    respond_with(@artist, @album)
  end

  def update
    @album = @artist.albums.find(params[:id])
    @album.update(album_params)
    respond_with(@artist, @album)
  end

  def destroy
    @album = @artist.albums.find(params[:id])
    @album.destroy
    respond_with(@artist, @album)
  end

  private

  def fetch_artist
    @artist = Artist.find(params[:artist_id])
  end

  def album_params
    params.require(:album).permit(:name, :released_at)
  end
end
