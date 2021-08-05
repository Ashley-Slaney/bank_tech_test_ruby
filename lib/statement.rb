class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def store_transaction(amount, balance)
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), amount: amount, balance: balance)
  end
end