class Entity < ApplicationRecord


    has_secure_token :auth_token, length: 36
    
    has_secure_password
    validates :email, presence: true, uniqueness: true

    scope :transaction_logs, -> { includes([:deposit, :withdraw])}
    has_many :deposit, -> { where("type IN (?)", [:BankCredit, :CashCredit, :WalletCredit]).where(status: true) }, class_name: 'TransactionLog', foreign_key: :reciever_id 
    has_many :withdraw, -> { where("type IN (?)", [:BankDebit, :CashDebit, :WalletDebit]).where(status: true) }, class_name: 'TransactionLog', foreign_key: :sender_id


    def balance
        puts self.deposit.sum(:amount), self.withdraw.sum(:amount)
        self.deposit.sum(:amount) - self.withdraw.sum(:amount)
    end
end
