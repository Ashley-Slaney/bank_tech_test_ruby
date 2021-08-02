require 'bank'

describe Bank do
  let(:bank) { Bank.new }

  it 'starts with 0 balance' do
    expect(bank.balance).to eq(0)
  end
end
