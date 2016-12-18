class EpisodesController < ApplicationController
  #before_action :authenticate_user!

  def show
    @episode = Episode.find_by(token: params[:token])
    @show = @episode.show
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

  private

  def episode_params
    params.require(:episode).permit(:episode_number)
  end

end
