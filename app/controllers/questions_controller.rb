class QuestionsController < ApplicationController
  # before_action checksignedin
  def create
    q = Question.new(ques:params[:ques], user:current_user)
    if q.save
      redirect_to root_path, notice: "your question is saved n online"
    else
      redirect_to root_path, notice:"correct problems"
    end
  end

  private

  def question_params
    # params.require()
  end
end