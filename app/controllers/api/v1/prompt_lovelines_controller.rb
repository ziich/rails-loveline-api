class Api::V1::PromptLovelinesController < Api::V1::BaseController
  before_action :set_prompt_loveline, only: [ :show,:destroy ]

  def index
    @prompt_lovelines = PromptLoveline.all.order('created_at DESC')
  end



  def show
  end

  def create
    @prompt_loveline = PromptLoveline.new(prompt_loveline_params)
    if @prompt_loveline.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @prompt_loveline.destroy
    head :no_content
  end


  private

  def set_prompt_loveline
    @prompt_loveline = PromptLoveline.find(params[:id])
  end

  def prompt_loveline_params
    params.require(:prompt_loveline).permit(:loveline_id, :prompt_id)
  end

  def render_error
    render json: { errors: @prompt_loveline.errors.full_messages }, status: :unprocessable_entity
  end



end
