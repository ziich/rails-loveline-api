class Api::V1::AnswersController < Api::V1::BaseController


  def index
    @answers = Answer.where(prompt_loveline_id: params[:prompt_loveline_id]).order('created_at DESC')
  end
  def create
  @answer = Answer.new(answers_param)
  @answer.user = User.find(params[:user_id])
  @answer.prompt_loveline = PromptLoveline.find(params[:prompt_loveline_id])
    if @answer.save
      render json: {}, status: :created
    else
      render_error
    end
  end

private

  def answers_param
    params.require(:answer).permit(:content)
  end

  def render_error
    render json: { errors: @answer.errors.full_messages },
      status: :unprocessable_entity
  end
end
