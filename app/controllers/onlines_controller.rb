class OnlinesController < ApplicationController
  def index
    @users = User.where(status: User::STATUS_ONLINE).page(params[:page])
  end
end
