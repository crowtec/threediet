class WelcomeController < ApplicationController
  def index
  end

  def stl_file
    send_file Rails.root.join('app', 'assets', '3d', params[:filename] + '.stl'), type: 'application/vnd.ms-pki.stl'
  end
end
