class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  
  # GET /profiles
  # GET /profiles.json
  def index
    @created = false
    @user = current_user
    @users = User.all
    @profiles = Profile.all
    @profiles.each do |p|
      if @user && @user.id == p.my_id then
        @created = true
      end
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @use = User.find(@profile.my_id)
    @target = User.find(@profile.user_id)
    if @use.id == 1 && @use.id == @profile.my_id && !@profile.user_id then
      do_it
    end
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @user = current_user
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.my_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profiles_path, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:target, :description, :address, :location, :exclude)
    end

    def do_it
      done = false
      @profiles = Profile.all
      @users = User.all
      while done == false do
        done = true
        @targets = User.all.order('random()')
        @users.each_index do |i|
          if @targets[i].id == @users[i].id then
            done = false
          end
        end
        puts '-'*20
        @users.each_index do |i|
          a = @users[i].id
          b = @targets[i].id
          puts '*'*20
          puts a
          puts b
          puts '*'*20
          @profiles.each do |x|
            if x.my_id == a then
              x.update(user_id: b)
            end
          end
        end
        puts '-'*20
      end
    end
end








