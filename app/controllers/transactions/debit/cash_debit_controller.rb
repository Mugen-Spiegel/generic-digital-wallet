class Transactions::Debit::CashDebitController < ApplicationController


    def show
        cash_debit = CashDebit.where(id: params[:id])
        render json: cash_debit, status: :ok
    end

    def create
        cash_debit = CashDebit.create!(
            currency: trans_params[:currency],
            amount: trans_params[:amount],
            sender_id: current_user.id,
            reciever_id: trans_params[:reciever_id],
            status: true
        )
        render json: cash_debit, status: :ok

    end

    private

    def trans_params
        params.permit(:reciever_id, :amount, :currency)
    end
end
