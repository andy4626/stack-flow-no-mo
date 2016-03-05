class QuestionsController < ApplicationController
  def index
    @questions = Question.order(updated_at: :desc)
  end

  def new
    @question = Question.new
    @tag = Tag.new
    unless logged_in?
      redirect_to root_path
    end
  end

  def create
    @question = Question.new(title: params[:title], content: params[:content], user_id: current_user.id)
    if logged_in?
      if @question.save
        tags = params[:tag].split(', ')
        tags.each do |tag|
          tag = Tag.new(name: tag)
          if tag.save
            TagQuestion.create(tag_id: tag.id, question_id: @question.id)
          end
        end
        redirect_to question_path(@question)
      else
        redirect_to :back
      end
    else
        redirect_to :back
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(updated_at: :desc)
    @q_comments = @question.comments
    @answer = Answer.new
    @comment = Comment.new
    @q_vote = @question.votes
  end

  private
  def get_params
    params.require(:question).permit(:title, :content).merge(user: current_user)
  end

  # def get_tag_params
  #   params.require(:question).permit(:name)
  # end
end

# <!-- <%= #form_for @question do |f|%>
# <fieldset>
#   <legend>Ask a Question!</legend>

#   <%=# f.label :title%>
#   <%=# f.text_field :title%>
#   <%=# f.label :content %>
#   <%=# f.text_area :content %>


#   <%= #f.submit %>
# </fieldset>
# <%#end%> -->

  # <!-- <label>Tags</label>
  # <input type="text" name="tag[name]"><br> -->
