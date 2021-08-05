require 'bank'

describe Bank do
  let(:bank) { Bank.new }
  let(:date) { Time.now.strftime("%d/%m/%Y") }
  let(:account) { double("Account", balance: 0) }
  let(:statement) { double("Statement", transactions: []) }

  it 'initializes the account class with 0 balance' do
    expect(account.balance).to eq(0)
  end
  
  it 'initializes the statement class' do
    expect(statement.transactions).to eq([])
  end

  # it 'prints the statement' do
  #   expect(bank.statement).to eq("date || credit || debit || balance")
  # end

  # it 'prints the statement after some transactions' do
  #   bank.deposit(1000)
  #   bank.deposit(2000)
  #   bank.withdraw(500)
  #   expect(bank.statement).to eq("date || credit || debit || balance\n#{date} || || 500.00 || 2500.00\n#{date} || 2000.00 || || 3000.00\n#{date} || 1000.00 || || 1000.00")
  # end

  # it 'does not duplicate the statement when calling for the statement consecutively' do
  #   bank.deposit(1000)
  #   bank.deposit(500)
  #   bank.statement
  #   expect(bank.statement).to eq("date || credit || debit || balance\n#{date} || 500.00 || || 1500.00\n#{date} || 1000.00 || || 1000.00")
  # end

end
