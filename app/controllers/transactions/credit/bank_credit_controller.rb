class Transactions::Credit::BankCreditController < ApplicationController

    
    def show
        bank_credit = BankCredit.where(id: params[:id])
        render json: bank_credit, status: :ok
    end

    def create
        bank_credit = BankCredit.create(
            currency: trans_params[:currency],
            amount: trans_params[:amount],
            sender_id: current_user.id,
            reciever_id: trans_params[:reciever_id],
            status: true
        )
        render json: bank_credit, status: :ok
    end
    
    private 
    def trans_params
        params.permit(:reciever_id, :amount, :currency)
    end
end
