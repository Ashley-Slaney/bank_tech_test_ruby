require 'statement'

describe Statement do
  let(:statement) { Statement.new }

  it 'stores the transactions in an array' do
    expect(statement.transactions).to eq([])
  end
end