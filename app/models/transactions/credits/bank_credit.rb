class BankCredit < Credit

    has_many :parent, class_name: 'BankDebit'


    def counter_transaction
        if self.parent.nil?
            BankDebit.create!(currency: self.currency, amount: self.amount, parent_id: self.id, sender_id: self.sender_id, reciever_id: self.reciever_id, status: true)
        end
    end
end