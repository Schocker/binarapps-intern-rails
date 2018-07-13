class CommentsController < ApplicationController
  def create 
    @comment = Comment.new(comment_params)
    post = Post.find(@comment.post_id)
    if @comment.save
      redirect_to post_url(post), notice: "A comment was added"
    else
      redirect_to post_url(post), notice: "Could not add comment"
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:commenter_name, :content, :post_id)
  end
end
