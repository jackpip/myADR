class CuesController < ApplicationController
  #before_action :authenticate_user!

  def new
    @cue = Cue.new
  end

  def update
    @episode = Episode.find(params[:cue][:episode_id])
    cue_params_ = cue_params
    cue_params_[:character] = Character.find_by(name: cue_params_[:character])
    @cue = Cue.find(params[:id])
    @cue.update_attributes(cue_params_)
    redirect_to episode_path(@episode)
  end

  def create
    @episode = Episode.find(params[:cue][:episode_id])
    cue_params_ = cue_params
    cue_params_[:character] = Character.find_by(name: cue_params_[:character])
    @cue = @episode.cues.create(cue_params_)
    redirect_to episode_path(@episode)
  end

  def destroy
    @cue = Cue.find(params[:id])
    @cue.destroy
    @episode = params[:episode]
    redirect_to episode_path(@episode)
  end

  private

  def cue_params
    params.require(:cue).permit(:start_time, :end_time, :dialogue, :notes, :private_notes, :called_by, :omit, :omit_notes, :between, :character, :episode_id)
  end

end
