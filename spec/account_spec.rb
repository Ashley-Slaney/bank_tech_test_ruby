require 'account'

describe Account do
  let(:account) { Account.new }
  let(:statement) { double("Statement", transactions: []) }

  it 'initializes the statement class' do
    expect(statement.transactions).to eq([])
  end

  it 'starts with 0 balance' do
    expect(account.balance).to eq(0.00)
  end

  it 'can deposit money' do
    account.deposit(100)
    expect(account.balance).to eq(100.00)
  end

  it 'needs a minimum of £1 to deposit money' do
    expect(account.deposit(0.73)).to eq("Minimum deposit amount: £1")
  end

  it 'can withdraw money' do
    account.deposit(50)
    account.withdraw(10)
    expect(account.balance).to eq(40)
  end

  it 'can not go below £0 when withdrawing money' do
    expect(account.withdraw(10)).to eq("Can not go below £0 balance")
  end
end