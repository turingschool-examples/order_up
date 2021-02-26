class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    if params[:query]
      @pets = Pet.search_name(params[:query])
    else
      @pets = []
    end
  end

  def new
    @application = Application.new
  end

  def create
      @application = Application.new(applications_params)
      if @application.save
        redirect_to "/applications/#{@application.id}"
      else
        flash.now[:error] = @application.errors.full_messages.to_sentence
        render :new
      end
  end

  def update
    application = Application.find(params[:id])
    application.update(applications_params)
    redirect_to "/applications/#{application.id}"
  end

  def admin
    @application = Application.find(params[:id])
  end

  private
  def applications_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status)
  end
end
