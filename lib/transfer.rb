require "pry"

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else
      false
    end
  end
  
  def execute_transaction
    if 
      valid? && @sender.balance > @amount && @status == "pending"
      @sender.deposit (@amount * -1)
      @receiver.deposit (@amount)
      @status = "complete"
    else
      @status ="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit (@amount)
      @receiver.deposit (@amount * -1)
      @status = "reversed"
    end
  end
end
