class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index

    @services = policy_scope(Service)

    @geocoded_services = Service.geocoded #returns services with coordinates

    @markers = @geocoded_services.map do |service|
      {
        lat: service.latitude,
        lng: service.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { service: service }),
        image_url: helpers.asset_url('man_map_icon.png')
      }
    end
  end


  def show
    @reviews = @service.reviews
    authorize @service
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    authorize @service
    @service.user_id = current_user.id
    if @service.save
      redirect_to user_dashboard_path
    else
      render 'new'
    end
  end

  def edit
    authorize @service
  end

  def update
    authorize @service
    if @service.update(service_params)
      redirect_to service_path(@service.id), notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @service
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
