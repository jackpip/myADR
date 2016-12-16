class ShowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shows = Show.find_by(user: current_user)
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
    @show = Show.create(show_params)
    redirect_to show_path(@show)
  end

  private

  def show_params
    params.require(:show).permit(:name)
  end

end
