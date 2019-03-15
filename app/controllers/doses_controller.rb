class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # @ingredient = Ingredient.find(dose_params[:ingredient_id])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to cocktail_path(@cocktail)
  end

  # def create
  #   @dose = Dose.new(dose_params)
  #   if @dose.save
  #     redirect_to cocktail_path(@dose)
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   @dose = Cocktail.find(params[:id])
  #   @dose.destroy
  # end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
