class WelcomeController < ApplicationController

  def index
  end

  def general_shop

  end

  def kits_shop
    @kit = Kit.all.first
  end

  def us

  end

  def how_it_works

  end
end
