class AnswerController < ApplicationController
  before_action :require_sign_in, only: [:index, :create]
  before_action :require_admin, only: [:index, :create]
  def index
    @questions = Question.where(status: 'waiting')
  end

  def create
    question = Question.find(params[:question][:question_id])
    question.answer = params[:question][:answer]
    if question.save
      flash[:notice] = 'Ответ отправлен'
      redirect_to answers_path
    else
      flash[:alert] = 'Ошибка отправки ответа'
      redirect_to answers_path
    end
  end


  private

  def require_sign_in
    unless current_user
      flash[:alert] = 'Вы должны войти в систему для просмотра этой страницы'
      redirect_to root_path
    end
  end

  def require_admin
    unless current_user.admin?
      flash[:alert] = 'Вы должны быть администратором для просмотра этой страницы'
      redirect_to root_path
    end
  end


end
