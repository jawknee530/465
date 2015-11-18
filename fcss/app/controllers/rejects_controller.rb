class RejectsController < ApplicationController
  before_action :set_reject, only: [:show, :edit, :update, :destroy]

  # GET /rejects
  # GET /rejects.json
  def index
    @rejects = Reject.all
  end

  # GET /rejects/1
  # GET /rejects/1.json
  def show
  end

  # GET /rejects/new
  def new
    @reject = Reject.new
  end

  # GET /rejects/1/edit
  def edit
  end

  # POST /rejects
  # POST /rejects.json
  def create
    @reject = Reject.new(reject_params)

    respond_to do |format|
      if @reject.save
        format.html { redirect_to @reject, notice: 'Reject was successfully created.' }
        format.json { render :show, status: :created, location: @reject }
      else
        format.html { render :new }
        format.json { render json: @reject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rejects/1
  # PATCH/PUT /rejects/1.json
  def update
    respond_to do |format|
      if @reject.update(reject_params)
        format.html { redirect_to @reject, notice: 'Reject was successfully updated.' }
        format.json { render :show, status: :ok, location: @reject }
      else
        format.html { render :edit }
        format.json { render json: @reject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rejects/1
  # DELETE /rejects/1.json
  def destroy
    @reject.destroy
    respond_to do |format|
      format.html { redirect_to rejects_url, notice: 'Reject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reject
      @reject = Reject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reject_params
      params.require(:reject).permit(:user_id, :profile_id, :profile_id, :user_id)
    end
end
