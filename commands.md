# IEX shell Commands

account1 = Account.register %User{name: "Icaro", email: "icaro@gmail.com"}
account2 = Account.register %User{name: "Jose", email: "jose@gmail.com"}  
accounts = [account1, account2]
account1.user

Account.bankTransfer(accounts, account1, account2, 1000)