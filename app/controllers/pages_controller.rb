class PagesController < ApplicationController
  before_action :user_authorized?, only: [:new_review, :contacts_send, :questions, :destroy_question, :reviews_moderation, :reviews_moderation_send]
  before_action :user_admin?, only: [:destroy, :reviews_moderation, :reviews_moderation_send]

  def main

  end

  def news

  end

  def contacts
    @question = Question.new
  end

  def about_us

  end

  def destroy_question
    @question = Question.find(params[:id])
    unless @question.user==current_user
      flash[:alert] = "Что-бы удалить вопрос, вы должны быть его автором"
      return
    end
    if @question.destroy
      flash[:notice] = "Ответ успешно удален"
      redirect_to questions_path
    else
      flash[:alert] = "Ошибка удаления ответа"
      redirect_to questions_path
    end
  end

  def questions
    @questions = Question.where(status: 'answered', user_id: current_user.id)
  end

  def contacts_send
    @question = Question.new(question_params)
    @question.status = "waiting"
    @question.user = current_user
    if @question.save
      flash[:notice] = "Ваш вопрос успешно отправлен"
      redirect_to contacts_path
    else
      render :contacts
    end
  end

  def reviews
    @reviews = Review.where(status: "confirmed").paginate(page: params[:page], per_page: 10)
    cookies[:rating] = 0
  end
  def reviews_moderation
    @reviews = Review.where(status: "pending").paginate(page: params[:page], per_page: 10)
  end
  def reviews_moderation_send
    review = Review.find_by(id:params[:r][:review_id])
    review.status = "confirmed"
    if review.save
      flash[:notice] = "Отзыв успешно подтвержден"
      redirect_to reviews_moderation_path
    else
      flash[:alert] = "Ошибка подтверждения отзыва"
      redirect_to reviews_moderation_path
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Отзыв удален"
      redirect_to pages_reviews_path
    else
      flash[:alert] = "Ошибка удаления"
      redirect_to pages_reviews_path
    end
  end

  def new_review
    review = Review.new(mark: cookies[:rating], comment: params[:review][0])
    review.user = current_user
    if review.save
      flash[:notice] = "Отзыв отправлен на модерацию"
      redirect_to pages_reviews_path
    else
      flash[:alert] = "Ошибка добавления отзыва"
      redirect_to pages_reviews_path
    end
  end

  private

  def question_params
    params.require(:question).permit( :body)
  end

  def user_authorized?
    unless current_user
      flash[:alert] = "Для выполнения требуется авторизация"
      redirect_to pages_reviews_path
    end
  end

  def user_admin?
    unless current_user.admin?
      flash[:alert] = "Для данного действия необходимо быть администратором"
      redirect_to root_path
    end
  end

end
