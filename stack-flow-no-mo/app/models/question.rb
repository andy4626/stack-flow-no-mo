class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :tag_questions
  has_many :tags, through: :tag_questions

  validates :title, :content, presence: true

  def user_voted?
    self.votes.pluck(:user_id).include?(current_user.id)
  end
end
