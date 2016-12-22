class ShowsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_show, only: [:show]

  def index
    @shows = current_user.shows
    @show = Show.new
  end

  def show
    @show = Show.find(params[:id])
    @episode = Episode.new
    @episodes = @show.episodes
  end

  def new
    @show = Show.new
  end

  def create
    @show = current_user.shows.create(show_params)
    redirect_to shows_path
  end

  def update
    @show = Show.find(params[:id])
    @show.update_attributes(show_params)
    @episode = Episode.find(params[:show][:episode_id])
    redirect_to episode_path(@episode)
  end

  private

  def show_params
    params.require(:show).permit(:name)
  end

  def require_authorized_for_current_show
    unless Show.find(params[:id]).users.include?(current_user)
      redirect_to shows_path, alert: "You don't have access to that show!"
    end
  end

end
