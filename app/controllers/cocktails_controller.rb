class CocktailsController < ApplicationController
  http_basic_authenticate_with name: "brevity", password: "CT9d43", except: [:index, :show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @cocktail_ingredients = @cocktail.cocktail_ingredients
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: "Cocktail successfully created."}
        format.json {render :show, status: :created, location: @cocktail }
      else
        format.html { render :new }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    respond_to do |format|
      if @cocktail.update(cocktail_params)
        format.html { redirect_to @cocktail, notice: "Cocktail successfully updated."}
        format.json {render :show, status: :created, location: @cocktail }
      else
        format.html { render :edit }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def cocktail_params
      params.require(:cocktail).permit(:name, :image_url, :instruction, :spirit_type, :description, cocktail_ingredients_attributes: [:quantity, ingredient_attributes: [:name]])
    end
end
