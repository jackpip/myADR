class EpisodesController < ApplicationController
  #before_action :authenticate_user!

  def show
    @episode = Episode.find_by(token: params[:token])
    @show = @episode.show
    @characters = @show.characters
    @character = Character.new
    @cue = Cue.new
    @cues = @episode.cues.order(:start_time, :end_time)
  end

  def new
    @episode = Episode.new
  end

  def create
    @show = Show.find(params[:episode][:show_id])
    @episode = @show.episodes.create(episode_params)
    redirect_to show_path(@show)
  end

  def update
    @episode = Episode.find_by(token: params[:token])
    @episode.update_attributes(episode_params)
    redirect_to episode_path(@episode)
  end

  def destroy
    @episode = Episode.find_by(token: params[:token])
    @episode.destroy
    @show = @episode.show
    redirect_to show_path(@show)
  end

  def lines_count
    @episode = Episode.find_by(token: params[:token])
    @show = @episode.show
  end

  private

  def episode_params
    params.require(:episode).permit(:episode_number, :token)
  end

end
