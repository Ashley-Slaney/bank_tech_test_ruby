require 'bank'

describe Bank do
  let(:bank) { Bank.new }

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
end