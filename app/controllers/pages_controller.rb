class PagesController < ApplicationController
  def home
    @services = Service.all.first(5)
  end
end
