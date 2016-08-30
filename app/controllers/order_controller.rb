class OrderController < ApplicationController
  def new
    redirect_to new_order_path(phase: params[:phase].to_i, order: order_params, kit: params[:kit], t_index: params[:t_index], c_index: params[:c_index]) if request.post?

    @phase = (params[:phase] || 1).to_i
    @order = params.has_key?(:order) ? Order.new(order_params) : Order.new
    @color_index = (params[:c_index] || 0).to_i % Color.count
    @color = @phase < 3 ? Color.offset(@color_index).first : Color.find(order_params[:color])

    #@kit_index = (params[:k_index] || 0).to_i % Kit.count
    #@kit = @phase < 3 ? Kit.offset(@kit_index).first : Kit.find(order_params[:kit])
    @kit = params.has_key?(:order) ? Kit.find(order_params[:kit]) : Kit.find(params[:kit])
    @tupper_index = (params[:t_index] || 0).to_i % @kit.tuppers.count
    @tupper = @kit.tuppers.at(@tupper_index)
    #@colors = Color.all if @phase.to_i == 2
    @colors = Color.all
  end

  def create
    @order = Order.new(order_params)
    @order.save!
    redirect_to root_path
  end

  private

    def order_params
      params.require(:order).permit(Order.permitted_params)
    end
end
