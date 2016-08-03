class ProductOptionsController < ApplicationController
	before_action :authenticate_user!
	before_action :manager_only
	before_action :set_product, only: [ :index, :new]
	before_action :set_product_option, only: [ :edit, :update, :destroy]

	def index
		@product_options = @product.product_options
	end
	
	def new
		@product_option = @product.product_options.new
	end
	
	def create
		@product_option = ProductOption.new(product_option_params)
		@product = @product_option.product

		if @product_option.save
			redirect_to product_options_path(@product_option.product)
		else
			render 'new'
		end	
	end
	
	def edit
	end

	def update
		if @product_option.update(product_option_params)
			redirect_to product_product_options_path(@product_option.product)
		else
			render 'edit'
		end
	end

	def destroy
		@product_option.destroy

		redirect_to product_product_options_path(@product_option.product)
	end
	
	private

	def set_product
		@product = Product.find(params[:product_id])
	end
	
	def set_product_option
		@product_option = ProductOption.find(params[:id])
	end
	
	def product_option_params
		params.require(:product_option).permit(:price, :grade, :weight, :product_id)
	end	

end
