class Admin::OrderController < AdminController

  before_action :load_resource, only: [:edit, :update, :show, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def edit
  end

  def update
    @order.add_kit(params[:order])
    @order.update(order_params)
    p "www" * 10
    p @order
    p "www" * 10
    redirect_to admin_order_index_path, :notice => 'Order was successfully updated.'
  rescue => e

    p "www" * 10
    p e
    p "www" * 10
    render :edit
  end

  def destroy
    @order.destroy
    redirect_to admin_order_index_path, :notice => 'Order was successfully destroyed.'
  end

  def download_zip
    Kit.first.pack_stl_files_to_zip

    redirect_to admin_order_index_path
  end

  private

  def order_params
    params.require(:order).permit(Order.permitted_params)
  end

  def load_resource
    @order = Order.find(params[:id])
  end


end