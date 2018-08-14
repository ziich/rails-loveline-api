class Api::V1::LikesController < Api::V1::BaseController

  def like
    @post = Post.find(params[:post_id])
    @post.liked_by User.find(params[:user_id])
    render json: {}, status: :ok
  end

  def unlike
    @post = Post.find(params[:post_id])
    @post.unliked_by User.find(params[:user_id])
    render json: {}, status: :ok
  end

  def num_likes
    @post = Post.find(params[:post_id])
    @post.get_likes.size
    render json: {}, status: :ok
  end
end
