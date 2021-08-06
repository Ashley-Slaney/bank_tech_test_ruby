require 'bank'

describe Bank do
  let(:bank) { Bank.new }
  let(:date) { Time.now.strftime("%d/%m/%Y") }

  it 'creates an account starting with 0 balance' do
    expect(bank.balance).to eq(0.00)
  end

  it 'does not allow less than £1 to deposit money' do
    expect(bank.deposit(0.52)).to eq("Minimum deposit amount: £1")
  end

  it 'can deposit money and return the balance' do
    expect(bank.deposit(75.23)).to eq(75.23)
  end

  it 'does not allow you to withdraw money that would take the balance below 0' do
    expect(bank.withdraw(500)).to eq("Can not go below £0 balance")
  end

  it 'can withdraw money and return the balance' do
    expect(bank.deposit(75.23)).to eq(75.23)
  end

  it 'returns the correct balance after random transactions' do
    bank.deposit(76.25)
    bank.deposit(5467.53)
    bank.withdraw(2347.89)
    expect(bank.balance).to eq(3195.89)
  end

  it 'displays the bank statement' do
    expect{ bank.print_statement }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'displays the bank statement after some transactions' do
    bank.deposit(100)
    bank.deposit(1000)
    bank.withdraw(100)
    expect{ bank.print_statement }.to output("date || credit || debit || balance\n#{date} || || 100.00 || 1000.00\n#{date} || 1000.00 || || 1100.00\n#{date} || 100.00 || || 100.00\n").to_stdout
  end

  it 'does not add a failed transaction' do
    expect(bank.withdraw(100)).to eq("Can not go below £0 balance")
    expect{ bank.print_statement }.to output("date || credit || debit || balance\n").to_stdout
  end
end