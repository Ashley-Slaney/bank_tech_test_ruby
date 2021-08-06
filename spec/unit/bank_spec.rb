require 'bank'

describe Bank do
  let(:bank) { Bank.new }
  let(:account) { double("Account", balance: 0) }
  let(:statement) { double("Statement", transactions: []) }

  it 'initializes the account class with 0 balance' do
    expect(account.balance).to eq(0)
  end
  
  it 'initializes the statement class' do
    expect(statement.transactions).to eq([])
  end

end
