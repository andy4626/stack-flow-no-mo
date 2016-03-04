class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:id])
    @comment = Comment.create(get_params)
    @question.update_attribute(:commentable, @comment)
  end

  private

  def get_params
    params.require(:comment).permit(:content).merge
  end
end
