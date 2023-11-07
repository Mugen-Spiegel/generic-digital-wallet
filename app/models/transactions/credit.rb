class Credit < TransactionLog


    after_create :counter_transaction

    def counter_transaction; end
end