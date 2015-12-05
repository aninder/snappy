class AnswersController < ApplicationController

  before_action :checkSignedIn

  def create
    u = User.find_by_id(params[:user_id])
    if u
      question = u.questions.where("questions.id = ?", params[:question_id]).first
      if !question.blank?
        answer = current_user.answers.build(question:question, ans:params[:answer][:ans])
        if answer.save
          redirect_to user_question_path(id:question.id), notice: "your answer is saved"
        else
          redirect_to user_question_path(id:question.id), notice: "fix your personnel problems first!"
        end
      else
        redirect_to root_path, notice: "sorry i forgot what the original question was!"
      end
    else
      redirect_to root_path, notice:"ur nuts"
    end
  end
end