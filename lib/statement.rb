class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  # responsible for outputting each transaction 
  def print_statement(transactions)    
    output = transactions.split("\n")
    output.each do |transaction|
      puts transaction
    end
  end

end