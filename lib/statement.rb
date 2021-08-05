class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  # responsible for outputting each transaction 
  def print_statement
    organise_transactions
    
    output = @statement_output.split("\n")
    output.each do |transaction|
      puts transaction
    end
    @statement_output
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
  end

end