class CuesController < ApplicationController
  before_action :authenticate_user!

  def new
    @cue = Cue.new
  end

  def update
    @cue = Cue.find(params[:id])
    puts params.inspect
    @cue.update_attributes(omit: params[:omit])
  end

  def create
    @episode = Episode.find(params[:cue][:episode_id])
    cue_params_ = cue_params
    cue_params_[:character] = Character.find_by(name: cue_params_[:character])
    @cue = @episode.cues.create(cue_params_)
    redirect_to episode_path(@episode)
  end

  private

  def cue_params
    params.require(:cue).permit(:start_time, :end_time, :dialogue, :notes, :private_notes, :called_by, :omit, :character, :episode_id)
  end

end
