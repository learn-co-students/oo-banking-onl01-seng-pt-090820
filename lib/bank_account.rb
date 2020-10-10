require "pry"

class BankAccount
  attr_accessor :balance, :status, :transfer
  attr_reader :name

  def initialize(name, status = "open")
    @name = name
    @balance = 1000
    @status = status
  end

  def deposit(money)
    self.balance += money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  # def valid?
  #   # if @balance == 0
  #   #   false
  #   # elsif @status == "closed"
  #   #   false
  #   # else
  #   #   true
  #   # end
  # end

  def valid?
    if self.balance > 0 && self.status == "open"
      true
    else
      false
  end
end

  def close_account
    @status = "closed"
  end

end


# review self and understanding of it
# make sure to call methods appropriately. it is either instance.method or class.method. we are always calling methods on something.
