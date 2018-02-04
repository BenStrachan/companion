class DashboardsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
  end

  def setting
  end
end
