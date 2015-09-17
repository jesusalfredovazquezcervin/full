class HomeController < ApplicationController
  def index
    dashboard_4
  end
end
def dashboard_4
  render :layout => "layout_2"
end
