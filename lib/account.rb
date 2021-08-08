class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0.00
    @transactions = []
  end

  # returns the current balance
  def display_balance
    return ('%.2f' % @balance).to_f
  end

  # updates the balance with the depositted amount - needs a minimum of £1 to deposit
  # and calls the transaction method to store the transaction
  def deposit(amount)
    if amount < 1
      return "Minimum deposit amount: £1"
    end
    @balance += amount
    store_transaction("#{'%.2f' % amount} ||", @balance)
    @balance
  end

  # updates the balance with the withdrawn amount - won't allow you to go below 0 and calls
  # the transaction method to store the transaction
  def withdraw(amount)
    if @balance - amount < 0
      return "Can not go below £0 balance"
    end
    @balance -= amount
    store_transaction("|| #{'%.2f' % amount}", balance)
    @balance
  end
  
  # pushes each transaction to the array that all of the transactions are being stored in
  def store_transaction(amount, balance)
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), amount: amount, balance: balance)
  end

  # rearranges the transactions array to show the most recent first
  def organise_transactions
    @statement_output = "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      @statement_output << "\n#{transaction[:date]} || #{transaction[:amount]} || #{'%.2f' % transaction[:balance]}"
    end
    @statement_output
  end
end