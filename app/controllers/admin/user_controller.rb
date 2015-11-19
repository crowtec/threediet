class Admin::UserController < AdminController
  before_action :authenticate_user!, only: [:password_edit, :password_update]
  layout 'admin'

  def password_edit
  end

  def password_update
    current_user.update(password_params)
    redirect_to admin_index_path, :notice => 'Password was successfully updated.'
  end

  private
  def password_params
    params.require(:user).permit(User.password_params)
  end

end
