class CharactersController < ApplicationController
  before_action :authenticate_user!

  def new
    @character = character.new
  end

  def create
    @episode = Episode.find(params[:character][:episode_id])
    @show = @episode.show
    @character = @show.characters.create(character_params)
    redirect_to episode_path(@episode)
  end

  private

  def character_params
    params.require(:character).permit(:name, :actor)
  end

end
