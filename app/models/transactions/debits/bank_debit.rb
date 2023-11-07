class BankDebit < Debit


    belongs_to :parent, class_name: 'BankCredit', optional: true

    private

    def counter_transaction
        if self.parent.nil?
            BankCredit.create!(currency: self.currency, amount: self.amount, parent_id: self.id, sender_id: self.sender_id, reciever_id: self.reciever_id, status: true)
        end
    end
end