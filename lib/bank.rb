class Bank 
  attr_reader :balance

  def initialize
    @balance = 0
    @transactions = []
    @statement_output = "date || credit || debit || balance"
  end

  def deposit(amount)
    @balance += amount
    transaction("#{'%.2f' % amount} ||")
    @balance
  end

  def withdraw(amount)
    if @balance - amount < 0
      return "Your balance can not go below 0"
    else
      @balance -= (amount)
      transaction("|| #{'%.2f' % amount}")
      @balance
    end
  end

  def transaction(amount)
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), amount: amount, balance: @balance)
  end

  def statement
    reverse_transactions

    output = @statement_output.split("\n")
    output.each do |transaction|
      puts transaction
    end
    @statement_output
  end

  def reverse_transactions
    @transactions.reverse.each do |transaction|
      @statement_output << "\n#{transaction[:date]} || #{transaction[:amount]} || #{'%.2f' % transaction[:balance]}"
    end
  end
end