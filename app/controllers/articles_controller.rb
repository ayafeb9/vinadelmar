class ArticlesController < ApplicationController
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show, :new, :create, :edit]
  before_action :authenticate_user!

  def index
    @articles = Article.all.order('created_at DESC') 
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments
  end

  def new
    @article = current_user.articles.build
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)
 
 	 if @article.save
#           flash[:notice] = "Article successfully saved!"
           redirect_to @article
	 else
	    render 'new'
	 end 
  end

  def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
