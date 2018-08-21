class Api::V1::LovelinesController < Api::V1::BaseController
  before_action :set_loveline, only: [:show, :destroy, :update]
  def index
    @lovelines = Loveline.all.order('created_at DESC')
  end

  def show

  end


  def create
    @loveline = Loveline.new()
    if @loveline.save
      render :index
    else
      render_error
    end
  end


  def destroy
    @loveline.destroy
    head :no_content
  end


  private

  # def loveline_params
  #   params.require(:loveline).permit(:user_one_id, :user_two_id)
  # end
  def render_error
    render json: { errors: @loveline.errors.full_messages },status: :unprocessable_entity
  end


  def set_loveline
    @loveline = Loveline.find(params[:id])
  end
end
