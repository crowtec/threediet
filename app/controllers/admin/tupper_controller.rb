class Admin::TupperController < AdminController

  def new
    @tupper = Tupper.new


  end

  def create
    p "wwww" * 5
    p tupper_params
    p "wwww" * 5
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
    @tupper = Tupper.find(params[:id])
  end

  def update
    @tupper = Tupper.update(tupper_params)
    redirect_to admin_tupper_index_path, :notice => 'Tupper was successfully updated.'
  rescue
    render :edit
  end

  def show
    @tupper = Tupper.find(params[:id])
  end

  def destroy
    @tupper = Tupper.find(params[:id])
    @tupper.destroy
    redirect_to admin_tupper_index_path, :notice => 'Tupper was successfully destroyed.'
  end

  private

  def tupper_params
    params.require(:tupper).permit(Tupper.tupper_params)
  end
end
