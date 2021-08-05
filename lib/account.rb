class Account
  attr_reader :balance 

  def initialize
    @statement = Statement.new
    @balance = 0.00
  end

  # updates the balance with the depositted amount - needs a minimum of £1 to deposit
  # and calls the transaction method to store the transaction
  def deposit(amount)
    if amount < 1
      return "Minimum deposit amount: £1"
    end
    @balance += amount
  end

  # updates the balance with the withdrawn amount - won't allow you to go below 0 and calls
  # the transaction method to store the transaction
  def withdraw(amount)
    if @balance - amount < 0
      return "Can not go below £0 balance"
    end
    @balance -= amount
  end
end