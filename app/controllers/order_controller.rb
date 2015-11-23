class OrderController < ApplicationController
  def new
    redirect_to new_order_path(phase: params[:phase].to_i + 1, order: order_params) if request.post?

    @phase = params[:phase] || 1
    @order = params.has_key?(:order) ? Order.new(order_params) : Order.new

    @kit_index = (params[:k_index] || 0).to_i % Kit.count
    @kit = Kit.offset(@kit_index).first
    @tupper_index = (params[:t_index] || 0).to_i % @kit.tuppers.count
    @tupper = @kit.tuppers.at(@tupper_index)

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
