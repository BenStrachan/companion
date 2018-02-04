class App::OnlinesController < App::BaseController
  def index
    @users = User.where(status: User::STATUS_ONLINE).page(params[:page])
  end
end
