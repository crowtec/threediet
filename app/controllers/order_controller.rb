class OrderController < ApplicationController
  def new
    @phase = params[:phase] || 1
    @order = params.has_key?(:order) ? Order.new(order_params) : Order.new
  end

  def new_kit
    redirect_to new_order_path(phase: params[:phase].to_i + 1, order: order_params)
  end

  def create
    @order = Order.create(order_params)
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(Order.permitted_params)
  end

end
