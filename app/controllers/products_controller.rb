class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update, :destroy, :show_pick]


	def index
		@products = Product.all

		if params[:category]
			@products = eval("@products.#{params[:category]}")
		end
	end

	def show
		@product_options = @product.product_options
	end

	def show_pick
		@product_option = @product.product_option(weight: params[:weight], grade: params[:grade])
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

<<<<<<< HEAD
  def product_params
    params.require(:product).permit(:name, :summary, :description, :picture, :picture_cache, :category)
  end
=======
	def product_params
		params.require(:product).permit(:name, :summary, :description, :picture, :picture_cache, :category)
	end
>>>>>>> f3e60ae97b9381306b2128dd0b4ca61378793e34
end
