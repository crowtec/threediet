class Admin::OrderController < AdminController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.update(order_params)
    redirect_to admin_order_index_path, :notice => 'Order was successfully updated.'
  rescue
    render :edit
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to admin_order_index_path, :notice => 'Order was successfully destroyed.'
  end

  private

  def order_params
    params.require(:order).permit(Order.order_params)
  end
end