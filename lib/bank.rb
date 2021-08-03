class Bank 
  attr_reader :balance

  def initialize
    @balance = 0
    @transactions = []
  end

  # deposit money
  def deposit(amount)
    @balance += amount
    transaction("#{'%.2f' % amount} ||")
    @balance
  end

  # withdraw money - won't allow you to go below 0
  def withdraw(amount)
    if @balance - amount < 0
      return "Your balance can not go below 0"
    else
      @balance -= (amount)
      transaction("|| #{'%.2f' % amount}")
      @balance
    end
  end
  
  # responsible for outputting each transaction 
  def statement
    reverse_transactions
    
    output = @statement_output.split("\n")
    output.each do |transaction|
      puts transaction
    end
    @statement_output
  end
  
  private 
  
  # pushes each transaction to the array that all of the transactions are being stored in
  def transaction(amount)
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), amount: amount, balance: @balance)
  end

  # shows the most recent transactions first
  def reverse_transactions
    @statement_output = "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      @statement_output << "\n#{transaction[:date]} || #{transaction[:amount]} || #{'%.2f' % transaction[:balance]}"
    end
  end

end