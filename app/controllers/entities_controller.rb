class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  # GET /entities or /entities.json
  def index
    @current_user = current_user
    @entities = current_user.entities
    # @entities =  Entity.find(params[:author_id])
    # @entities = @groups.entities.all
    #   @current_user = current_user
    #   @group = Group.find(params[:author_id])
    #   # @purchases = Purchase.all
    #   @group_purchases = Group.find(params[:group_id]).group_purchases.order(created_at: :desc)
  end

  # GET /entities/1 or /entities/1.json
  def show
    @current_user = current_user
    @entities = current_user.entities
  end

  # GET /entities/new
  def new
    @current_user = current_user
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    @current_user = current_user
    @entity = current_user.entities.new(entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:id, :name, :amount)
  end
end
