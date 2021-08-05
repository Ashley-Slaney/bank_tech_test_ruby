require_relative 'account'
require_relative 'statement'

class Bank 
  attr_reader :balance, :account

  def initialize
    @account = Account.new
    @statement = Statement.new
  end

  def balance
    @account.display_balance
  end

  def deposit(amount)
    if @account.deposit(amount) == "Minimum deposit amount: £1"
      return "Minimum deposit amount: £1"
    end
    @statement.store_transaction("#{'%.2f' % amount} ||", balance)
    balance
  end

  def withdraw(amount)
    if @account.withdraw(amount) == "Can not go below £0 balance"
      return "Can not go below £0 balance"
    end
    @statement.store_transaction("|| #{'%.2f' % amount}", balance)
    balance
  end

  def print_statement
    @statement.print_statement
    balance
  end

end
