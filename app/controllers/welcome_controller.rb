class WelcomeController < ApplicationController
  def index
  end

  def stl_file
    # response.headers['Content-Type'] = 'application/vnd.ms-pki.stl'
    send_file Rails.root.join("app", 'assets', '3d', params[:filename] + '.stl'), type: "application/vnd.ms-pki.stl"
  end
end
