class QuestionsController < ApplicationController
  def index
    @questions = Question.order(updated_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(get_params)
    if logged_in? && @question.save
      redirect_to question_path(@question)
    else
      redirect_to :back
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @q_comments = @question.comments
    @answer = Answer.new
    @comment = Comment.new
    @q_vote = @question.votes
  end

  private
  def get_params
    params.require(:question).permit(:title, :content).merge(user: current_user)
  end
end
