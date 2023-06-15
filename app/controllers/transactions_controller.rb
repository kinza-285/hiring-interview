class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all.page(params[:page]).per(10)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
    @managers = Manager.all if params[:type] == 'extra'

    render "new_#{params[:type]}"
  end

  def create
    @transaction = Transaction.new(transaction_params(params))

    if @transaction.save
      redirect_to @transaction
    else
      redirect_to new_transaction_path type: params[:type]
    end
  end

  private

  def transaction_params(params)
    if params[:type] == 'extra'
      params.require(:transaction).permit(:first_name, :last_name, :from_amount, :from_currency, :to_currency, :manager_id)
    elsif params[:type] == 'large'
      params.require(:transaction).permit(:first_name, :last_name, :from_amount, :from_currency, :to_currency)
    elsif params[:type] == 'small'
      params.require(:transaction).permit(:from_amount, :from_currency, :to_currency)
    end
  end
end
