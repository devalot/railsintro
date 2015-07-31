class SongsController < ApplicationController

  def index;   with_album {@songs = @album.songs}; end
  def show;    with_album; end
  def new;     with_album {@song = @album.songs.new}; end
  def create;  with_album {@song = @album.songs.create(song_params)}; end
  def edit;    with_album; end
  def update;  with_album {@song.update(song_params)}; end
  def destroy; with_album {@song.destroy}; end

  private

  def with_album (&block)
    @album = Album.where(artist_id: params[:artist_id],
                         id:        params[:album_id]).first

    if params[:id].present?
      @song = @album.songs.find(params[:id])
    end

    block.call if block
    respond_with(@album.artist, @album, @songs || @song)
  end

  def song_params
    params.require(:song).permit(:name, :duration)
  end
end
