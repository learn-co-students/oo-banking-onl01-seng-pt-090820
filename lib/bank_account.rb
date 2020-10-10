

class BankAccount
attr_accessor :balance, :status, :account_hash
attr_reader :name

def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
end

def deposit(deposited_money)
    @balance += deposited_money
end

def display_balance
    p "Your balance is $#{self.balance}."
end

def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end
  



















end