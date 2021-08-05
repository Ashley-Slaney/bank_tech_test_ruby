class Account
  attr_reader :balance 

  def initialize
    @balance = 0.00
  end

  def deposit(amount)
    if amount < 1
      return "Minimum deposit amount: £1"
    end
    @balance += amount
  end

  def withdraw(amount)
    if @balance - amount < 0
      return "Can not go below £0 balance"
    end
    @balance -= amount
  end
end