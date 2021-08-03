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
  end

  def withdraw(amount)
    @balance -= (amount)
    transaction("|| #{'%.2f' % amount}")
  end

  def transaction(amount)
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), amount: amount, balance: @balance)
  end

  def statement
    @transactions.reverse.each do |transaction|
      @statement_output << "\n#{transaction[:date]} || #{transaction[:amount]} || #{'%.2f' % transaction[:balance]}"
    end

    output = @statement_output.split("\n")
    output.each do |transaction|
      puts transaction
    end

    @statement_output
  end
end