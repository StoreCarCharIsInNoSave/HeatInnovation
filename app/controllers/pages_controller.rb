class PagesController < ApplicationController
  before_action :user_authorized?, only: [:new_review, :contacts_send]
  before_action :user_admin?, only: [:destroy]

  def main

  end

  def news

  end

  def contacts
    @question = Question.new
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
    @reviews = Review.paginate(page: params[:page], per_page: 10)
    cookies[:rating] = 0
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
      flash[:notice] = "Отзыв успешно добавлен"
      redirect_to pages_reviews_path
    else
      flash[:alert] = "Ошибка добавления отзыва"
      redirect_to pages_reviews_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def user_authorized?
    unless current_user
      flash[:alert] = "Для выполнения требуется авторизация"
      redirect_to pages_reviews_path
    end
  end

  def user_admin?
    unless current_user.admin?
      flash[:alert] = "Для удаления отзыва необходимо быть администратором"
      redirect_to root_path
    end
  end

end
