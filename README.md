# bank_tech_test_ruby
Makers week 10 tech test to practice producing high quality code using TDD and OOP.

## How I approached the challenge
Firstly I took the important pieces of information for the challenge and turned them into user stories:

```
As an account holder,
So that I can keep my money safe,
I would like to be able to deposit money into my account.
```
```
As an account holder,
So that I can access my money,
I would like to be able to withdraw money from my account.
```
```
As an account holder,
So that I can see my transactions,
I would like to be able to see my bank statement.
```
```
As an account holder,
So that my bank statement makes sense to me,
I would like to be able to see which transactions were going in and which were coming out.
```

After I created the user stories I started to consider which methods I would need to implement these user stories. I used a TDD process to achieve these user stories with RSpec and Ruby.

### How to run this program

In the command line:
`git clone https://github.com/Ashley-Slaney/bank_tech_test_ruby.git`
`cd bank_tech_test_ruby`
`irb`
`require './lib/bank.rb`
You can now create an instance with `Bank.new` and test out the program
Here's an example:
`bank = Bank.new`
`bank.deposit(1000)`
`bank.deposit(2000)`
`bank.withdraw(500)`
`bank.statement`
If you want to run the unit tests, `exit` out of the IRB and run `rspec`

## Specification

### Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
