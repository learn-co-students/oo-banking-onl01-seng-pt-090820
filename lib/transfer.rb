class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if (self.valid? == true) && (self.status == "pending") && (sender.balance > amount)
      sender.withdrawal(self.amount) && receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      receiver.withdrawal(self.amount) && sender.deposit(self.amount)
      self.status = "reversed"
    end
  end
  
end
