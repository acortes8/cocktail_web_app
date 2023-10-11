class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])

    if @cocktail.update(cocktail_params)
      redirect_to @cocktail
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def cocktail_params
      params.require(:cocktail).permit(:name, :image_url, :ingredient, :instruction)
    end
end
