class Bank 
  attr_reader :balance, :account

  def initialize
    @account = Account.new
    # @balance = 0
    # @transactions = []
  end

  # updates the balance with the depositted amount - needs a minimum of £1 to deposit
  # and calls the transaction method to store the transaction

  # def deposit(amount)
  #   if amount < 1
  #     return "Minimum deposit amount: £1"
  #   end
  #   @balance += amount
  #   transaction("#{'%.2f' % amount} ||")
  #   @balance
  # end

  # updates the balance with the withdrawn amount - won't allow you to go below 0 and calls
  # the transaction method to store the transaction

  # def withdraw(amount)
  #   if @balance - amount < 0
  #     return "Your balance can not go below 0"
  #   end
  #   @balance -= (amount)
  #   transaction("|| #{'%.2f' % amount}")
  #   @balance
  # end
  
  # responsible for outputting each transaction 

  # def statement
  #   organise_transactions
    
  #   output = @statement_output.split("\n")
  #   output.each do |transaction|
  #     puts transaction
  #   end
  #   @statement_output
  # end
  
  # private 
  
  # pushes each transaction to the array that all of the transactions are being stored in

  # def transaction(amount)
  #   @transactions.push(date: Time.now.strftime("%d/%m/%Y"), amount: amount, balance: @balance)
  # end

  # shows the most recent transactions first

  # def organise_transactions
  #   @statement_output = "date || credit || debit || balance"
  #   @transactions.reverse.each do |transaction|
  #     @statement_output << "\n#{transaction[:date]} || #{transaction[:amount]} || #{'%.2f' % transaction[:balance]}"
  #   end
  # end

end
