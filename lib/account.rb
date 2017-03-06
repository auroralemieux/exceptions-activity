require_relative 'InsufficientFundsError'

module Bank
  class Account
    attr_reader :id, :balance
    def initialize(id, balance)
      if balance < 0
        raise ArgumentError.new("Initial balance must be positive (got #{balance})")
      end

      @id = id
      @balance = balance
    end

    def withdraw(amount)
      if amount < 0
        raise ArgumentError.new("Cannot withdraw a negative amount (got #{amount})")
        # return @balance
      end
      raise InsufficientFundsError.new("Cannot overdraw account (got #{amount})") if @balance - amount < 0

      # raise InsufficientFundsError.new("Cannot withdraw; balance would go negative") if @balance - amount < 0
      @balance -= amount
    end

    def deposit(amount)
      if amount < 0
        raise ArgumentError.new("Cannot withdraw a negative amount (got #{amount})")
      end

      @balance += amount
    end
  end
end
