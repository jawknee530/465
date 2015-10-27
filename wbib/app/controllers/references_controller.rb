class ReferencesController < ApplicationController
  before_action :set_reference, only: [:edit, :update, :destroy]

  # GET /topics/:topic_id/references
  def index
    @topic = Topic.find params[:topic_id]
    @references = @topic.references
  end

  # GET topics/:topic_id/references/new
  def new
    @topic = Topic.find params[:topic_id]
    @reference = @topic.references.new
  end

  # GET /reference/1/edit
  def edit
  end

  # POST topics:/:topic_id/references
  def create
    @topic = Topic.find params[:topic_id]
    @reference = @topic.references.new(reference_params)

    if @reference.save
      redirect_to @topic
    else
      render :new
    end
  end

  # PATCH/PUT /references/1
  def update
    if @reference.update(reference_params)
      redirect_to topic_reference_url(@reference.topic), notice: 'Reference was successfuly updated.'
    else
      render :edit
    end
  end

  # DELETE /references/1
  def destroy
    @reference.destroy
    redirect_to @reference.topic
  end

  private
  def set_reference
    @reference = Reference.find(params[:id])
  end

  def reference_params
    params.require(:reference).permit(:URL)
  end
end
