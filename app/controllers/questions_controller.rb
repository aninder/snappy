class QuestionsController < ApplicationController
  # before_action checksignedin
  def index
    @question = Question.new
    @questions = Question.all
  end

  def create
    @question = current_user.questions.build(question_params)
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
end