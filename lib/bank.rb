require_relative 'account'
require_relative 'statement'

class Bank 
  attr_reader :balance, :account

  def initialize(statement = Statement.new)
    @account = Account.new
    @statement = statement
  end

  def balance
    @account.display_balance
  end

  def deposit(amount)
    if @account.deposit(amount) == "Minimum deposit amount: £1"
      return "Minimum deposit amount: £1"
    end
    balance
  end

  def withdraw(amount)
    if @account.withdraw(amount) == "Can not go below £0 balance"
      return "Can not go below £0 balance"
    end
    balance
  end

  def print_statement
    transactions = @account.organise_transactions
    @statement.print_statement(transactions)
    balance
  end

end
