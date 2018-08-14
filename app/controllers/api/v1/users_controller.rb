class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :destroy, :update]
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)
    @user.loveline = Loveline.find(params['loveline_id'])
    if @user.save
      render :show,status: :created
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

  def login
    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    render json: {
     userId: @user.id
    }
  end

  private

  def wechat_params
    p ENV['MY_APPID']
    p ENV['MY_SECRET']

  {
    appid: ENV['MY_APPID'],
    secret: ENV['MY_SECRET'],
    js_code: params[:code],
    grant_type: "authorization_code"
  }
  end

  def wechat_user
    @wechat_response ||= RestClient.post(URL, wechat_params)
    p @wechat_response
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :open_id)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },status: :unprocessable_entity
  end

end
