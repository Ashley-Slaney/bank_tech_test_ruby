class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    organise_transactions
    
    output = @statement_output.split("\n")
    output.each do |transaction|
      puts transaction
    end
    @statement_output
  end

  private

  def store_transaction(amount, balance)
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), amount: amount, balance: balance)
  end

  def organise_transactions
    @statement_output = "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      @statement_output << "\n#{transaction[:date]} || #{transaction[:amount]} || #{'%.2f' % transaction[:balance]}"
    end
  end

end