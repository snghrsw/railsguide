class CommentsController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
    render json: @article.comments
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    render json: @article
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    render json: @article
  end

  private def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
