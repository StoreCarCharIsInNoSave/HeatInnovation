class PagesController < ApplicationController
  before_action :user_authorized?, only: [:new_review]
  before_action :user_admin?, only: [:destroy]
  def main

  end
  def contacts

  end
  def news

  end

  def reviews
    @reviews = Review.paginate(page: params[:page], per_page: 10)
    cookies[:rating] = 0
  end
  def destroy
    @review = Review.find(params[:id])
    if  @review.destroy
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
  def user_authorized?
    unless current_user
      flash[:alert] = "Для добавления отзыва необходимо авторизоваться"
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
