class Admin::KitController < AdminController

  before_action :load_resource, only: [:edit, :update, :show, :destroy]

  def new
    @kit = Kit.new
  end

  def create
    @kit = Kit.new(kit_params)
    @kit.add_tuppers(params[:kit])
    @kit.save!
    redirect_to admin_kit_index_path, :notice => 'Kit was successfully created.'
  rescue
    render :new
  end

  def index
    @kits = Kit.all
  end

  def edit
  end

  def update
    @kit.add_tuppers(params[:kit])
    @kit.update(kit_params)
    redirect_to admin_kit_index_path, :notice => 'Kit was successfully updated.'
  rescue
    render :edit
  end

  def show
  end

  def destroy
    @kit.destroy
    redirect_to admin_kit_index_path, :notice => 'Kit was successfully destroyed.'
  end

  private

  def kit_params
    params.require(:kit).permit(Kit.kit_params)
  end

  def load_resource
    @kit = Kit.find(params[:id])
  end
  
end
