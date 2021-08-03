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
    expect(bank.statement).to eq("date || credit || debit || balance\n03/08/2021 || || 500.00 || 2500.00\n03/08/2021 || 2000.00 || || 3000.00\n03/08/2021 || 1000.00 || || 1000.00")
  end

  it 'can not go below 0 balance' do
    expect(bank.withdraw(50)).to eq("Your balance can not go below 0")
  end
end
