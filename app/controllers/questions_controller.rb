class QuestionsController < ApplicationController
  before_action :checkSignedIn, only: [:create, :index, :edit, :update]

  def index
    @questions = current_user.questions
  end

  def create
    @question = current_user.questions.build(question_params)
    checkUnsafeDirectObjectReference

    if @question.save
      redirect_to root_path, notice: "your question is saved n online"
    else
      redirect_to root_path, notice:"question cant be blank"
    end
  end

  def show
    @question = Question.find params[:id]
  end

  def all
    @question = Question.new
    @questions = Question.includes(:user).page(params[:page]).per_page 3
    # User.joins(:addresses).where("addresses.country = ?", "Poland").preload(:addresses)
    # @questions = Question.all.select("questions.user_id","questions.ques","questions.created_at","users.name","users.id").joins(:user)
    # binding.pry
  end

  def edit
    @question = Question.find_by_id(params[:id])
    if @question
      if current_user != @question.user
        redirect_to user_question_path(id:params[:id]), notice: "you can only edit your own questions"
      else
        render :edit
      end
    else
      return redirect_to root_path, notice: "question does not exist"
    end
  end

  def update

  end

  private

  def question_params
    params.require(:question).permit(:ques)
  end

  def checkUnsafeDirectObjectReference
    if current_user != params[:user_id]
    headers["X-Hacking-Allowed"] = "nohacking"
    end
  end
end
