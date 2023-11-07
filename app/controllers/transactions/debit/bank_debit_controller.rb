class Transactions::Debit::BankDebitController < ApplicationController

    def show
        bank_debit = BankDebit.where(id: params[:id])
        render json: bank_debit, status: :ok
    end

    def create
        bank_debit = BankDebit.create!(
            currency: trans_params[:currency],
            amount: trans_params[:amount],
            sender_id: current_user.id,
            reciever_id: trans_params[:reciever_id],
            status: true
        )
        render json: bank_debit, status: :ok

    end
    
    def update
        
    end

    def destroy
        
    end

    private

    def trans_params
        params.permit(:reciever_id, :amount, :currency)
    end
end
