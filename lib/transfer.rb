class Transfer
  # your code here
  attr_accessor :transfer, :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def sender
    @sender
  end

  def receiver
    @receiver
  end

  def amount
    @amount
  end

  def valid?
    true  if self.receiver.valid? && self.sender.valid?

  end
  
  def execute_transaction
    if @sender.balance >@amount &&@status == "pending" && valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
