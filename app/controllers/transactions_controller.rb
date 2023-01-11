class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[create show edit update destroy]

  def index
    @current_user = current_user
    @group = Group.find(params[:group_id])
    @transactions = Group.find(params[:group_id]).transactions.order(created_at: :desc)
    @transaction_sum = Group.find(params[:group_id]).sum(:amount).transactions.order(created_at: :desc)
  end

  def new
    @current_user = current_user
    @group = Group.find_by_id(params[:group_id])
    # # @transaction = Group.find_by_id(params[:group_id]).transactions
    # @transactions = Group.find(params[:group_id]).transactions.new
  end

  def create
    @group = current_user.groups.new(group_params)
    @transaction = current_user.groups.transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html do
          redirect_to group_transaction_url(@transaction), notice: 'Group was successfully created.'
        end
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount)
  end
end
