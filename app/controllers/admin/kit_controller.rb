class KitController < AdminController

  def stl_file
    send_file Rails.root.join('app', 'assets', 'stl', params[:filename] + '.stl'), type: "application/vnd.ms-pki.stl"
  end
end
