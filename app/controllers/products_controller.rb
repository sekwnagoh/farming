class ProductsController < ApplicationController
	
	before_action :set_product, only: [:show, :edit, :update, :destroy]


	def product_params
		params.require(:product).permit(:name, :description, :picture, :picture_cache)
	end

	def index 
		@products = Product.all

		if params[:category]
			@products = eval("@products.#{params[:category]}")
		end
	end
	
	def show
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)

    respond_to do |format|
      if @product.save
       	format.html { redirect_to @product, notice: 'Product was successfully created.' }
       	format.json { render :show, status: :created, location: @product }
     	else
      	format.html { render :new }
       	format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit

	end	

	def update
		respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
	end

  private
	def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :picture, :picture_cache, :category)
    end
end
