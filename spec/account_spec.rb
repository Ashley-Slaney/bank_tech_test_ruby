require 'account'

describe Account do
  let(:account) { Account.new }

  it 'starts with 0 balance' do
    expect(account.balance).to eq(0.00)
  end

  it 'returns the balance when depositing' do
    account.deposit(200)
    expect(account.deposit(300)).to eq(500)
  end

  it 'can deposit money' do
    account.deposit(100)
    expect(account.balance).to eq(100.00)
  end

  it 'needs a minimum of £1 to deposit money' do
    expect(account.deposit(0.73)).to eq("Minimum deposit amount: £1")
  end

  it 'returns the balance when withdrawing' do
    account.deposit(100)
    expect(account.withdraw(10)).to eq(90)
  end

  it 'can withdraw money' do
    account.deposit(50)
    account.withdraw(10)
    expect(account.balance).to eq(40)
  end

  it 'can withdraw more money' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    expect(account.balance).to eq(2500.00)
  end

  it 'can not go below £0 when withdrawing money' do
    expect(account.withdraw(10)).to eq("Can not go below £0 balance")
  end
end