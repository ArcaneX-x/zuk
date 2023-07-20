class CataloguesController < ApplicationController

  def new
    @catalogue = Catalogue.new
  end

  def create
    @catalogue = Catalogue.new(catalogue_params)
    if @catalogue.save
      redirect_to catalogue_path(@catalogue)
      flash[:notice] = "Create"
    else
      render :new
    end
  end

  def index
    @catalogues = Catalogue.all
  end

  def show
    @catalogue = Catalogue.find(params[:id])
  end

  def edit
    @catalogue = Catalogue.find(params[:id])
  end

  def update
    if @catalogue.update(catalogue_params)
      redirect_to catalogues_path
      flash[:notice] = "Успешно добавлен"
    else
      flash[:alert] = "Произошла ошибка"
      render :index
    end
  end

  private

  def catalogue_params
    params.require(:catalogue).permit(:image, :title, :description)
  end
end
