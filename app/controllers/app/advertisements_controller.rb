class App::AdvertisementsController < App::BaseController
  before_action :authenticate_user!, :except => [:index]
  before_action :set_advertisement, only: [
                        :show, :edit, :update, :destroy, :interest,
                        :comment, :set_private_chat]

  # GET /advertisements
  # GET /advertisements.json
  def index
    @advertisements = Advertisement.page(params[:page])
  end

  # GET /advertisements/1
  # GET /advertisements/1.json
  def show
  end

  # GET /advertisements/new
  def new
    @advertisement = Advertisement.new
  end

  # GET /advertisements/1/edit
  def edit
    authorize! :edit, @advertisement
  end

  # POST /advertisements
  # POST /advertisements.json
  def create
    @advertisement = current_user.ads.new(advertisement_params)

    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to app_advertisements_url, notice: 'Advertisement was successfully created.' }
        format.json { render :show, status: :created, location: @advertisement }
      else
        format.html { render :new }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisements/1
  # PATCH/PUT /advertisements/1.json
  def update
    authorize! :update, @advertisement
    respond_to do |format|
      if @advertisement.update(advertisement_params)
        format.html { redirect_to app_advertisements_url, notice: 'Advertisement was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertisement }
      else
        format.html { render :edit }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisements/1
  # DELETE /advertisements/1.json
  def destroy
    authorize! :destroy, @advertisement
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to app_advertisements_url, notice: 'Advertisement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def interest
    @advertisement.interesters.push(current_user)

    Notification.create(
      user_id: current_user.id,
      content: "interested on",
      link: app_advertisement_path(@advertisement)
    )


    redirect_to app_advertisement_path(@advertisement),
                notice: 'You has been interested advertisement successfully'
  end

  def comment
    @advertisement.comments.create(
      content: params[:content],
      is_private: params[:is_private].present?,
      user_id: current_user.id
    )

    Notification.create(
      user_id: current_user.id,
      content: "commented on",
      link: app_advertisement_path(@advertisement)
    )

    redirect_to app_advertisement_path(@advertisement),
                notice: 'Comment has been posted successfully'
  end

  def set_private_chat
    if @advertisement.user_id == current_user.id
      @advertisement.private_comments.delete_all
      @advertisement.update private_user_id: params[:user_id]

      redirect_to app_advertisement_path(@advertisement),
                  notice: 'Private chat has been seted successfully'
    else
      redirect_to app_advertisement_path(@advertisement),
                  alert: 'You don\'t have permission'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertisement_params
      params.require(:advertisement).permit(:title, :description, :city)
    end
end
