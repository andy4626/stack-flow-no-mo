class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end

  def index
  	@tags = Tag.order(updated_at: :desc)
  end
end
