class Transactions::Debit::WalletDebitController < ApplicationController


    def show
        wallet_debit = WalletDebit.where(id: params[:id])
        render json: wallet_debit, status: :ok
    end

    def create
        wallet_debit = WalletDebit.create!(
            currency: trans_params[:currency],
            amount: trans_params[:amount],
            sender_id: current_user.id,
            reciever_id: trans_params[:reciever_id],
            status: true
        )
        render json: wallet_debit, status: :ok

    end
    
    private

    def trans_params
        params.permit(:reciever_id, :amount, :currency)
    end

end
