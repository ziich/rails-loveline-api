class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :destroy, :update]

  def index
    @users = User.all
  end

  def show
  end


  def update
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  def create
    @user = User.new(user_params)
    @user.loveline = Loveline.find(params['loveline_id'])
    if @user.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :avatar_url, :gender,:open_id)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },status: :unprocessable_entity
  end

end
