class Api::V1::CommentsController < Api::V1::BaseController

  def index
    @comments = Comment.where(post_id: params[:post_id]).order('created_at DESC')
  end

  def create
  @comment = Comment.new(comments_param)
  @comment.user = User.find(params[:user_id])
  @comment.post_id = params[:post_id]
    if @comment.save
      render json: {}, status: :created
    else
      render_error
    end
  end

private

  def comments_param
    params.require(:comment).permit(:content)
  end

  def render_error
    render json: { errors: @comment.errors.full_messages },
      status: :unprocessable_entity
  end
end
