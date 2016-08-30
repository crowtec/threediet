class KitController < ApplicationController
  def index
    @kits = Kit.all
  end
end