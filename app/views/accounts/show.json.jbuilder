json.id @account.id
json.accountname @account.name
json.status @account.status ? "active" : "disable"

json.ammount @account.decorate.balance
json.blance @account.currency_type ? "VND" : "USA"