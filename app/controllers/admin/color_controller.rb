class Admin::ColorController < AdminController

  before_action :load_resource, only: [:edit, :update, :show, :destroy]

  def new
    @color = Color.new
  end

  def create
    @color = Color.new()
    @color.name = color_params[:name]
    @color.r = color_params[:r].to_f / 255
    @color.g = color_params[:g].to_f / 255
    @color.b = color_params[:b].to_f / 255
    @color.intensity = color_params[:intensity]
    @color.save!
    redirect_to admin_color_index_path, :notice => 'Color was successfully created.'
  rescue
    render :new
  end

  def index
    @colors = Color.all
  end

  def edit
  end

  def update
    @color.update(color_params)
    redirect_to admin_color_index_path, :notice => 'Color was successfully updated.'
  rescue
    render :edit
  end

  def show
  end

  def destroy
    @color.destroy
    redirect_to admin_color_index_path, :notice => 'Color was successfully destroyed.'
  end

  private

  def color_params
    params.require(:color).permit(Color.permitted_params)
  end

  def load_resource
    @color = Color.find(params[:id])
  end

end
