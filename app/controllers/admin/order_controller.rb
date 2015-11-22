class Admin::OrderController < AdminController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def download_zip
    Kit.first.pack_stl_files_to_zip

    redirect_to admin_order_index_path
  end
end