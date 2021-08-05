require 'bank'

describe Bank do
  let(:bank) { Bank.new }
  let(:date) { Time.now.strftime("%d/%m/%Y") }

  it 'starts with 0 balance' do
    expect(bank.balance).to eq(0.00)
  end

  it 'can deposit money' do
    bank.deposit(100)
    expect(bank.balance).to eq(100.00)
  end

  it 'can withdraw money' do
    bank.deposit(1000)
    bank.deposit(2000)
    bank.withdraw(500)
    expect(bank.balance).to eq(2500.00)
  end

  it 'prints the statement' do
    expect(bank.statement).to eq("date || credit || debit || balance")
  end

  it 'prints the statement after some transactions' do
    bank.deposit(1000)
    bank.deposit(2000)
    bank.withdraw(500)
    expect(bank.statement).to eq("date || credit || debit || balance\n#{date} || || 500.00 || 2500.00\n#{date} || 2000.00 || || 3000.00\n#{date} || 1000.00 || || 1000.00")
  end

  it 'can not go below 0 balance' do
    expect(bank.withdraw(50)).to eq("Your balance can not go below 0")
  end

  it 'does not duplicate the statement when calling for the statement consecutively' do
    bank.deposit(1000)
    bank.deposit(500)
    bank.statement
    expect(bank.statement).to eq("date || credit || debit || balance\n#{date} || 500.00 || || 1500.00\n#{date} || 1000.00 || || 1000.00")
  end

  it 'needs a minimum of £1 to deposit money' do
    expect(bank.deposit(0.73)).to eq("Minimum deposit amount: £1")
  end
end
