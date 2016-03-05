class CommentsController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    if params[:answer_id]
      @answer = Answer.find(params[:answer_id])
    end
    @comment = Comment.new
  end

  def create
    @question = Question.find(params[:question_id])
    if logged_in?
      if params[:answer_id]
        @answer = Answer.find(params[:answer_id])
        @comment = @answer.comments.new(get_params)
      else
        @comment = @question.comments.new(get_params)
      end
      if @comment.save
        redirect_to question_path(@question)
      else
        @errors = ["Your comment can't be blank."]
        render :new
      end
    else
      redirect_to :back
    end
  end

  private

  def get_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
