class AnswersController < ApplicationController

  def create
    @answer = Answer.new(get_params)
    if @answer.save
      redirect_to question_show_path(@answer.question)
    else
      @errors = @answer.errors.full_messages
      render question_show_path(@answer.question)
    end
  end

  private

  def get_params
    params.require(:answer).permit(:content).merge(question_id: params[:question_id], user_id: current_user.id)
  end

end
