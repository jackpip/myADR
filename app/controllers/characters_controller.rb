class CharactersController < ApplicationController
  #before_action :authenticate_user!

  def new
    @character = character.new
  end

  def index
    puts params.inspect
    @episode = Episode.find_by(token: params[:episode_token])
    @show = @episode.show
    @cues = @episode.cues.order(:start_time, :end_time)
    @characters = @episode.show.characters
  end

  def show
    @episode = Episode.find_by(token: params[:episode_token])
    @show = @episode.show
    @character = Character.find(params[:id])
    @cues = @episode.cues.order(:start_time, :end_time).select { |cue| cue.character == @character }
    puts params.inspect
  end

  def update
    @episode = Episode.find_by(token: params[:episode_token])
    @character = Character.find(params[:id])
    @character.update_attributes(character_params)
    redirect_to episode_path(@episode)
  end

  def create
    @episode = Episode.find_by(token: params[:episode_token])
    @show = @episode.show
    @character = @show.characters.create(character_params)
    redirect_to episode_path(@episode)
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    @episode = Episode.find_by(token: params[:episode_token])
    redirect_to episode_path(@episode)
  end

  private

  def character_params
    params.require(:character).permit(:name, :abbr, :actor)
  end

end
