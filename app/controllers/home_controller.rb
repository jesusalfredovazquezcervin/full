class HomeController < ApplicationController
  def index
    dashboard_4
  end
  def login
    render :layout => "empty"
  end
end
def dashboard_4
  render :layout => "layout_2"
end
