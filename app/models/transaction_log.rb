class TransactionLog < ApplicationRecord

    self.primary_key = "id"
    
    belongs_to :sender, class_name: 'Entity', optional: true
    belongs_to :reciever, class_name: 'Entity', optional: true

    before_create :uuid

    enum :currency, [ :USD ]

    private

    def uuid
        self.id = SecureRandom.uuid if self.id.blank?
    end
end

