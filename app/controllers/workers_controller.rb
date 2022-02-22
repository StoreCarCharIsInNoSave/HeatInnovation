class WorkersController < ApplicationController
  before_action :require_user, only: [  :new, :create, :edit, :update, :destroy]
  before_action :need_admin, only: [  :new, :create, :edit, :update, :destroy]

  def index
    @workers = Worker.paginate(:page => params[:page], :per_page => 9)
  end

  def destroy
    worker = Worker.find(params[:id])
    if worker.destroy
      flash[:notice] = "Сотрудник успешно удален"
      redirect_to workers_path
    else
      flash[:alert] = "Ошибка удаления сотрудника"
      render 'index'
    end
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.image=params[:worker]["Загрузить фото"] if params[:worker]["Загрузить фото"]
    if @worker.save
      flash[:notice] = "Сотрудник успешно создана"
      redirect_to workers_path
    else
      flash[:alert] = "Сотрудник создания услуги"
      render 'new'
    end
  end

  def update
    @worker = Worker.find(params[:id])
    @worker.image=params[:worker]["Загрузить фото"] if params[:worker]["Загрузить фото"]
    if @worker.update_attributes(worker_params)
      flash[:notice] = "Сотрудник успешно обновлен"
      redirect_to workers_path
    else
      flash[:alert] = "Ошибка обновления сотрудника"
      render 'edit'
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  private
  def worker_params
    params.require(:worker).permit(:name, :email, :position, :image)
  end

  def require_user
    unless user_signed_in?
      flash[:alert] = "Для доступа к этой странице необходимо авторизоваться"
      redirect_to new_user_session_path
    end
  end

  def need_admin
    unless  current_user.is_admin?
      flash[:alert] = "Для доступа к этой странице необходимо быть администратором"
      redirect_to root_path
    end
  end

end
