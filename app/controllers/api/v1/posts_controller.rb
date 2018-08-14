class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_post, only: [ :show, :destroy ]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def for_current_user
    @posts = Post.all.order('created_at DESC')
    @posts = @posts.where(user_id: User.find(params[:user_id]))
    render :index
  end


  def show
  end


  def create
    p "creating............................"
    p params.inspect
    p params['user_id']
    @post = Post.new(post_params)
    @post.loveline = Loveline.find(params['loveline_id'])
    @post.user = User.find(params['user_id'])
    if @post.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end



  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :title, :image_url )
  end

  def render_error
    render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
  end



end
