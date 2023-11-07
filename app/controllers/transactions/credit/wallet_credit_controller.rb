class Transactions::Credit::WalletCreditController < ApplicationController

    def show
        wallet_credit = WalletCredit.where(id: params[:id])
        render json: wallet_credit, status: :ok
    end

    def create
        wallet_credit = WalletCredit.create(
            currency: trans_params[:currency],
            amount: trans_params[:amount],
            sender_id: current_user.id,
            reciever_id: trans_params[:reciever_id],
            status: true
        )
        render json: wallet_credit, status: :ok
    end
    
    private 
    def trans_params
        params.permit(:reciever_id, :amount, :currency)
    end

end
