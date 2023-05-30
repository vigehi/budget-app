class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :set_entity, only: [:edit, :update, :destroy]

  def index
    @entities = @group.entities
  end

  def new
    @entity = @group.entities.new
  end

  def create
    @entity = @group.entities.new(entity_params)
    if @entity.save
      flash[:notice] = 'Transaction created successfully'
      redirect_to group_entities_path(@group)
    else
      flash.now[:alert] = 'Transaction creation failed'
      render action: 'new'
    end
      end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def set_entity
    @entity = @group.entities.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
