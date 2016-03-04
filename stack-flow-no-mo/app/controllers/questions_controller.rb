class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    if logged_in?
      @question.create(get_params)
      redirect_to question_show_path(@question)
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
    @vote = Vote.new
  end

  private
  def get_params
    params.require(:question).permit(:title, :content).merge(user: current_user)
  end
end
