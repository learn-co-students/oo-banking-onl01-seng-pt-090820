class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return (@sender.valid? && @receiver.valid?)
  end

  def execute_transaction
    if (@sender.balance > @amount)
      if (valid? && @status != "complete")
        @receiver.balance += @amount
        @sender.balance -= @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (@receiver.balance > @amount)
      if (valid? && @status == "complete")
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
