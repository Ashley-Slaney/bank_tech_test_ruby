require 'bank'

describe Bank do
  let(:bank) { Bank.new }

  it 'starts with 0 balance' do
    expect(bank.balance).to eq(0)
  end

  it 'can deposit money' do
    bank.deposit(100)
    expect(bank.balance).to eq(100)
  end
end
