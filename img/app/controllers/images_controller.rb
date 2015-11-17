class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @user = current_user
    if @user then
      a = @user.id
      @myImages = Image.where(user_id: a)
      @priImages = @user.image_users.map {|image_user| image_user.image}
    end
    @pubImages = Image.where(private: 0)
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @use
    @user = current_user
    @curUsers = Set.new
    ImageUser.all.each{|x| if x.image_id == @image.id then 
                      User.all.each {|y| if x.user_id == y.id then
                     @curUsers.add(y) end} end}
    @users = Set.new
    User.all.each{|u| if @curUsers.include?(u) then else @users.add(u) end}
    @users.map!{|u| [u.name, u.id]}

    @imageUsers = ImageUser.all
    @image = Image.find params[:id]
    @tags = @image.tags
    @tag = @image.tags.new
    @imageuser = ImageUser.new
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
    @imageUsers = ImageUser.all
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    generate_filename
    @image.user = current_user
    @uploaded_io = params[:image][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def generate_filename
      @image.filename = ('a'..'z').to_a.shuffle[0,20].join
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:filename, :private, :user_id, :user_id)
    end
end
