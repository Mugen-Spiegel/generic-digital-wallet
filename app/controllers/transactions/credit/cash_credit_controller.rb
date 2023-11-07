class Transactions::Credit::CashCreditController < ApplicationController

    def show
        cash_credit = CashCredit.where(id: params[:id])
        render json: cash_credit, status: :ok
    end

    def create
        cash_credit = CashCredit.create(
            currency: trans_params[:currency],
            amount: trans_params[:amount],
            sender_id: current_user.id,
            reciever_id: trans_params[:reciever_id],
            status: true
        )
        render json: cash_credit, status: :ok
    end
    
    private 
    def trans_params
        params.permit(:reciever_id, :amount, :currency)
    end

end
