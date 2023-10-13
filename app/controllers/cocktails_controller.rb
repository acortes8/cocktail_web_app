class CocktailsController < ApplicationController
  http_basic_authenticate_with name: "brevity", password: "CT9d43", except: [:index, :show]

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

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def cocktail_params
      params.require(:cocktail).permit(:name, :image_url, :instruction)
    end
end
