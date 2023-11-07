class Debit < TransactionLog

    validates :amount, :numericality => { :less_than_or_equal_to => :validate_amount }

    after_create :counter_transaction

    def validate_amount
        Entity.transaction_logs.find(self.sender_id).balance
    end

    def counter_transaction; end

end