class StoresController < ApplicationController

  before_filter :find_cart, :except=>:empty_cart
  def index

    @products=Product.find_products_for_sale
    @cart =find_cart
  end


  def add_to_cart
    product=Product.find(params[:id])
    @cart=find_cart
    @current_item=@cart.add_product(product)
    respond_to do |format|
      format.js 
      
    end
  
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to accsee invalid product #{params[:id]}")
    redirect_to_index("Invalid product")
  end
  
  def checkout
    @cart=find_cart
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order=Order.new
    end
  end
def save_order
  @cart=find_cart
  @order=Order.new(params[:order])
  @order.add_line_items_from_cart(@cart)
  if @order.save
    session[:cart]=nil
    redirect_to_index(I18n.t('flash.thanks'))
  else
    render :action=>:checkout
  end
end
def empty_cart
  session[:cart]=nil
  redirect_to_index  
end
protected
def authorize
  
end


private 
def redirect_to_index(msg=nil)
  flash[:notice]=msg if msg
  redirect_to :action=>'index'
end

def find_cart
    #unless session[:cart]
     # session[:cart]=Cart.new
    #end
    #session[:cart]
    @cart=(session[:cart]||=Cart.new)
end

end
