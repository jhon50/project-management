class CommentsController < ApplicationController
  NotAuthorizedError = Class.new(StandardError)

  before_action :authenticate_user!

  skip_forgery_protection

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])

    authorize(@comment)

    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :post_id, :project_id).merge(user: current_user)
  end

  def authorize(resource)
    raise NotAuthorizedError unless resource.user_id == current_user.id
  end
end
