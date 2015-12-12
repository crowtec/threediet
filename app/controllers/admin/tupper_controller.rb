class Admin::TupperController < AdminController


  before_action :load_resource, only: [:edit, :update, :show, :destroy]

  def new
    @tupper = Tupper.new
  end

  def create
    @tupper = Tupper.new(tupper_params)
    @tupper.save!
    redirect_to admin_tupper_index_path, :notice => 'Tupper was successfully created.'
  rescue
    render :new
  end

  def index
    @tuppers = Tupper.all
  end

  def edit
  end

  def update
    @tupper.update(tupper_params)
    redirect_to admin_tupper_index_path, :notice => 'Tupper was successfully updated.'
  rescue
    render :edit
  end

  def show
  end

  def destroy
    @tupper.destroy
    redirect_to admin_tupper_index_path, :notice => 'Tupper was successfully destroyed.'
  end

  private

  def tupper_params
    params.require(:tupper).permit(Tupper.permitted_params)
  end

  def load_resource
    @tupper = Tupper.find(params[:id])
  end
end
