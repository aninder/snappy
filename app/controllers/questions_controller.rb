class QuestionsController < ApplicationController
  before_action :checkSignedIn, only: :create

  def index
    @question = Question.new
    @questions = Question.all.includes(:user)
  end

  def create
    @question = current_user.questions.build(question_params)
    if current_user != params[:user_id]
      headers["X-Hacking-Allowed"] = "nohacking"
    end
    if @question.save
      redirect_to root_path, notice: "your question is saved n online"
    else
      redirect_to root_path, notice:"question cant be blank"
    end
  end

  private

  def question_params
    params.require(:question).permit(:ques)
  end

# function_level_access_control
  def checkSignedIn
    if !signed_in?
      return head 420
    end
  end
end