class OrderController < ApplicationController
  def new
    @phase = params[:phase] || 1
    @order = params.has_key?(:order) ? Order.new(order_params) : Order.new
    
    if @phase.to_i == 2
      collection
    end
  end

  def new_kit
    redirect_to new_order_path(phase: params[:phase].to_i + 1, order: order_params)
  end

  def new_tupper
    redirect_to new_order_path(phase: params[:phase].to_i, order: @order, element: params[:element], tupper: params[:tupper], kit: params[:kit])
  end

  def new_collect
    redirect_to new_order_path(phase: params[:phase].to_i, order: @order, kit: params[:kit], change_kit: params[:change_kit])
  end

  def create
    @order = Order.create(order_params)
    redirect_to root_path
  end

  private

    def order_params
      params.require(:order).permit(Order.permitted_params)
    end

    def collection
      if params.has_key?(:kit)
        if params.has_key?(:change_kit)
          last = Kit.order_by(:id => 'asc').last
          @kit = last.id.to_s == params[:kit] ? Kit.first : Kit.where(:id.gt => params[:kit]).first
          @kit_element = 0
          @kit_tupper = Tupper.find(@kit.lunch_ids[@kit_element])
        elsif params.has_key?(:element)
          @kit = Kit.find(params[:kit])
          @kit_element = params[:element].to_i
          @kit_element = @kit_element == @kit.lunch_ids.size ? @kit_element = 0 : @kit_element
          @kit_element = @kit_element < 0 ? @kit_element = @kit.lunch_ids.size - 1 : @kit_element
          @kit_tupper = Tupper.find(@kit.lunch_ids[@kit_element])
        end
      elsif
        @kit = Kit.first
        @kit_element = 0
        @kit_tupper = Tupper.find(@kit.lunch_ids[@kit_element])
      end
    end
end
