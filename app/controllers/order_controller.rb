class OrderController < ApplicationController
  def new
    @phase = params[:phase] || 1
    @order = params.has_key?(:order) ? Order.new(order_params) : Order.new

    if @phase == "2"
      kit_piece
    end
  end

  def new_kit
    redirect_to new_order_path(phase: params[:phase].to_i + 1, order: order_params)
  end

  def new_piece
    redirect_to new_order_path(phase: params[:phase].to_i, order: @order, operation: params[:operation], tupper: params[:tupper])
  end

  def create
    @order = Order.create(order_params)
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(Order.permitted_params)
  end

  def kit_piece
    if params.has_key?(:operation)
      if params[:operation] == "next"
        last = Tupper.order_by(:id => 'asc').last
        if last.id.to_s == params[:tupper]
          @tupper = Tupper.first
        elsif
        @tupper = Tupper.where(:id.gt => params[:tupper]).first
        end
      elsif params[:operation] == "prev"
        first = Tupper.first
        if first.id.to_s == params[:tupper]
          @tupper = Tupper.order_by(:id => 'asc').last
        elsif
        @tupper = Tupper.where(:id.lt => params[:tupper]).first
        end
      end
    elsif
    @tupper = Tupper.first
    end
  end
end
