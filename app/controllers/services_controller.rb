class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
    @reviews = @service.reviews
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user_id = current_user.id
    if @service.save
      redirect_to user_dashboard_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service.id), notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
      redirect_to user_dashboard_path
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :price_per_hour, :photo, :location, :description, :category_id)
  end

end
