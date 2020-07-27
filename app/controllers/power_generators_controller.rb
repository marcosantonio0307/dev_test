class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
  end

  def search
  	if params[:text_search] != nil
  	  @text_search = params[:text_search].to_s
  	  @power_generators = PowerGenerator.where('name ILIKE ?', "%#{@text_search}%")
  	else
  	  @power_generators = PowerGenerator.where('price <= ?', params[:price_max].to_f)
  	  @power_generators = @power_generators.where('weight <= ?', params[:weight_max].to_f)
  	  if params[:structure_type] != "all"
  	  	@power_generators = @power_generators.where(structure_type: params[:structure_type].to_s)
  	  end
  	  if params[:manufacturer] != 'all'
  	  	@power_generators = @power_generators.where(manufacturer: params[:manufacturer].to_s)
  	  end
  	  @power_generators.order!(:price)
  	end
  	respond_to do |format|
  	  format.html
  	  format.json
  	  format.js
  	end
  end

  def calc_freight
  	freight = Freight.where(state: params[:uf].upcase)
    byebug
    @freight_price = freight.cost
  	respond_to do |format|
  	  format.html
  	  format.json
  	  format.js
  	end
  end
end
