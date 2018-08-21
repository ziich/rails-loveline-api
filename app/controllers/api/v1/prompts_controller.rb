class Api::V1::PromptsController < Api::V1::BaseController
  before_action :set_prompt, only: [ :show, :destroy ]

  def index
    @prompts = Prompt.all.order('created_at DESC')
  end
  def show
  end

  def create
    @prompt = Prompt.new(prompt_params)
    if @prompt.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @prompt.destroy
    head :no_content
  end


  private

  def set_prompt
    @prompt = Prompt.find(params[:id])
  end

  def prompt_params
    params.require(:prompt).permit(:content)
  end

  def render_error
    render json: { errors: @prompt.errors.full_messages }, status: :unprocessable_entity
  end



end
