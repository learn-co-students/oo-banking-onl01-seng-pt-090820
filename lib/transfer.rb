require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    # @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  # def execute_transaction
  #   if @status != "complete" && sender.valid?
  #     @receiver.balance = @receiver.balance + amount
  #     @sender.balance = @sender.balance - amount
  #     @status = "complete"
  #   elsif
  #     sender.balance < amount
  #     @status = "rejected"
  #     "Transaction rejected. Please check your account balance."
  #   end
  # end

  def execute_transaction
      if @status != "complete" && valid? && sender.balance > amount
        @receiver.balance = @receiver.balance + amount
        @sender.balance = @sender.balance - amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

  # def reverse_transfer
  #   if self.execute_transaction && valid? && @receiver.balance > amount && status == "complete"
  #     @receiver.balance = @receiver.balance - amount
  #     @sender.balance = @sender.balance + amount
  #     @status = "reversed"
  #   end

  def reverse_transfer
    if valid? && @receiver.balance > amount && status == "complete"
      binding.pry
      @receiver.balance = @receiver.balance - amount
      @sender.balance = @sender.balance + amount
      @status = "reversed"
    end
  end

end
