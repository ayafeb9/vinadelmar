class AnswersController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy, :create]

  def create
    @answer = @post.answers.create(params[:answer].permit(:answer))
    @answer.user_id = current_user.id if current_user
    @answer.save

    if @answer.save
      redirect_to post_path(@post)
    else
      render :template => 'posts/show'
    end
  end

  def edit
    @answer = @post.answers.find(params[:id])
  end

  def update
    @answer = @post.answers.find(params[:id])
    if @answer.update(params[:answer].permit(:answer))
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @answer = @post.answers.find(params[:id])
    @answer.destroy
    redirect_to post_path(@post)
  end

  private 
  def find_post
    @post = Post.find(params[:post_id])
  end
  def find_answer
    @answer = @post.answers.find(params[:id])
  end
end
