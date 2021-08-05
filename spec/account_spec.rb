require 'account'

describe Account do
  let(:account) { Account.new }

  it 'starts with 0 balance' do
    expect(account.balance).to eq(0.00)
  end

  it 'can deposit money' do
    account.deposit(100)
    expect(account.balance).to eq(100.00)
  end

end