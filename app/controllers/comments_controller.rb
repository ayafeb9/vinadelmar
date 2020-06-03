class CommentsController < ApplicationController
 # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params.require(:comment).permit(:commenter, :body, :article_id))
    redirect_to article_path(@article)      end
 
  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
 
    if @comment.update(params[:comment].permit(:body))
      redirect_to article_path(@article), notice: "Your comment has been updated."
    else
      render 'edit'
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), notice: "Your comment has been deleted."
  end
 
end

