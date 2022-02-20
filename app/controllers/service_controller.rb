class ServiceController < ApplicationController

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

end
