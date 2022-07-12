class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show update destroy ]

  # GET /transactions
  def index
    @transactions = Transaction.all

    # @transactions = Transaction.where(user_id: authorized_user.id)

    render json: @transactions
  end

  # GET /transactions/1
  def show
    # @transaction = Transaction.find_by(params[:id])
    @transaction = Transaction.find_by(id:params[:id])
    if @transaction == nil
        render json: @transaction, status: :unprocessable_entity
    else
        render json: @transaction
    end
    
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = authorized_user.id

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    @transaction = Transaction.find(params[:id])

    @transaction.update(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end

  end

  # def destroy
  #   Transaction.destroy(params[:id])
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.permit(:input_amount, :output_amount, :input_currency, :output_currency, :user_id)
    end
end
