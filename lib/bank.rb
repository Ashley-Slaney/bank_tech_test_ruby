require_relative 'account'
require_relative 'statement'

class Bank 
  attr_reader :balance, :account

  def initialize
    @account = Account.new
    @statement = Statement.new
  end

  def deposit(amount)
    balance = @account.deposit(amount)
    @statement.store_transaction("#{'%.2f' % amount} ||", balance)
    balance
  end

  def withdraw(amount)
    balance = @account.withdraw(amount)
    @statement.store_transaction("|| #{'%.2f' % amount}", balance)
    balance
  end

  def print_statement
    @statement.print_statement
    @account.balance
  end

end
