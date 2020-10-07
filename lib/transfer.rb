class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :counter# your code here

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @counter = 0
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? == false 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @sender.balance < @amount or @sender.valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @counter < 1
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @counter += 1
      @status = "complete"
    end

  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.withdraw(@amount)
      @status = "reversed"

    end

  end

end
