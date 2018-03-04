class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to products_path
  	else
  		@errors = @product.errors.full_messages
  		render :new
  	end	
  end		

  def edit
    @product = Product.find(params[:id])
  end  

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      redirect_to products_path, :notice => "Product has been modified"
    else
      @errors = @product.errors.full_messages
      render :edit
    end  
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, :notice => "Product has been deleted"
  end

  private
  def product_params
  	params.require(:product).permit(:name, :price, category_ids: [])
  end
end
