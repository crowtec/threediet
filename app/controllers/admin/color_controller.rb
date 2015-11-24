class Admin::ColorController < AdminController

  before_action :load_resource, only: [:edit, :update, :show, :destroy]

  def new
    @color = Color.new
  end

  def create
    logger.debug "    "
    logger.debug "    "
    logger.debug "    "
    logger.debug "    "
    logger.debug color_params
    logger.debug "    "
    logger.debug "    "
    logger.debug "    "

    @color = Color.new(color_params)
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
