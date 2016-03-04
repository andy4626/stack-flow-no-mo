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
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.update_attributes(get_params)
      redirect_to question_show_path(@question)
    else
      render :edit
    end
  end

  private
  def get_params
    params.require(:question).permit(:title, :content).merge(user: current_user)
  end
end
