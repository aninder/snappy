class AnswersController < ApplicationController

  before_action :checkSignedIn

  def create
    u = User.find(params[:user_id])
    if u
      question = u.questions.where("questions.id = ?", params[:question_id])
      if !question.blank?
        answer = current_user.answers.build(equestion:question, ans:params[:ans])
        if answer.save
          redirect_to question, notice: "your answer is saved"
        else
          redirect_to question, notice: "fix your personel problems first!"
        end
      else
        redirect_to question, notice: "sorry i forgot what the original question was!"
      end
    else
      redirect_to root_path, notice:"ur nuts"
    end

  end
end