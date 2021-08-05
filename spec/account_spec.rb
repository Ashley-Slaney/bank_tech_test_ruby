require 'account'

describe Account do
  let(:account) { Account.new }

  it 'starts with 0 balance' do
    expect(account.balance).to eq(0.00)
  end
end