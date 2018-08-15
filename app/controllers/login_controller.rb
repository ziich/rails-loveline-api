class LoginController < ApplicationController
URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

def login
  @user = User.find_by(open_id: wechat_user.fetch("openid"))

  if @user
    render json: {
      userId: @user.id,
      lovelineId: @user.loveline.id
    }
  else
    loveline = Loveline.create()
    @user = User.create(open_id: wechat_user.fetch("openid"), loveline_id: loveline.id)
    render json: {
      userId: @user.id,
      lovelineId: @user.loveline.id
    }
  end
end

def wechat_params
  {
    appid: ENV['MY_APPID'],
    secret: ENV['MY_SECRET'],
    js_code: params[:code],
    grant_type: "authorization_code"
  }
  end

def wechat_user
  @wechat_response ||= RestClient.post(URL, wechat_params)
  @wechat_user ||= JSON.parse(@wechat_response.body)
end
end
