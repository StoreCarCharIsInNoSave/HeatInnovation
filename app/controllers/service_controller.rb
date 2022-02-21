class ServiceController < ApplicationController
  before_action :require_user, only: [  :new, :create, :edit, :update, :destroy]
  before_action :need_admin, only: [  :new, :create, :edit, :update, :destroy]

  def index
    @services = Service.paginate(:page => params[:page], :per_page => 9)
  end

  def new
    @service = Service.new
  end

  def destroy
    service = Service.find(params[:id])
    if service.destroy
      flash[:notice] = "Услуга успешно удалена"
      redirect_to services_path
    else
      flash[:alert] = "Ошибка удаления услуги"
      render 'index'
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.image=params[:service]["Загрузить фото"] if params[:service]["Загрузить фото"]
    if @service.update_attributes(service_params)
      flash[:notice] = "Услуга успешно обновлена"
      redirect_to services_path
    else
      flash[:alert] = "Ошибка обновления услуги"
      render 'edit'
    end
  end

  def create
    @service = Service.new(service_params)
    @service.image=params[:service]["Загрузить фото"] if params[:service]["Загрузить фото"]
    if @service.save
      flash[:notice] = "Услуга успешно создана"
      redirect_to services_path
    else
      flash[:alert] = "Ошибка создания услуги"
      render 'new'
    end
  end
  private
  def service_params
    params.require(:service).permit(:name, :description, :price, :image)
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
