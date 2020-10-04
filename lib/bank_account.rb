class BankAccount
    attr_accessor :status, :balance, :deposit, :withdraw
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        @balance = @balance + amount
    end

    def withdraw(amount)
        @balance = @balance - amount
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        if @status == "open" && @balance > 0
            return true
        else
            return false
        end
    end

    def balance
        @balance
    end

    def close_account
        @balance = 0
        @status = "closed"
    end

end
