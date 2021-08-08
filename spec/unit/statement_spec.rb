require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:date) { Time.now.strftime("%d/%m/%Y") }
  let(:transaction) { "date || credit || debit || balance\nsome_transaction" }

  it 'can print a bank statement' do
    expect{ statement.print_statement(transaction) }.to output("date || credit || debit || balance\nsome_transaction\n").to_stdout
  end
end