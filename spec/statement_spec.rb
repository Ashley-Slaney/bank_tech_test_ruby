require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:date) { Time.now.strftime("%d/%m/%Y") }

  it 'stores the transactions in an array' do
    expect(statement.transactions).to eq([])
  end

  it 'stores multiple transactions' do
    statement.send(:store_transaction, 100, 100)
    statement.send(:store_transaction, 400, 500)
    statement.send(:store_transaction, 500, 1000)
    expect(statement.transactions).to eq([{date: date, amount: 100, balance: 100},
                                          {date: date, amount: 400, balance: 500},
                                          {date: date, amount: 500, balance: 1000}])
  end

  it 'prints the statement' do
    expect(statement.print_statement).to eq("date || credit || debit || balance")
  end
end