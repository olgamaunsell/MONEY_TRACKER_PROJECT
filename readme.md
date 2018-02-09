## MoneyTracker

You want to start tracking your spending in an attempt to be more frugal with money. You have decided to make a budgeting app to help you see where all of your money is being spent.

You must be able to create new Transactions ( which should include a merchant name, e.g. Tesco, and a value ) which have an associated Tag (e.g. 'food', 'clothes'). Your app would then be able to track a total, and display this in a view.

### MVP:

- Create new transactions
- Display a list of all transactions
- Display total amount spent
- Display total amount spent by tag

### Extensions:

- CRUD actions for the transactions
- Show a warning when the total expenditure is over budget (set a hard coded budget first)
- Add a date to the transactions and view total spending by month
- Optional comment entry allowed when creating/editing a transaction
- By able to create/edit & delete monthly budgets by tag
- Display the budget for that month/tag
- Display the actual spend for that month/tag
- Display the remaining amount for month/tag
- View total spend by vendor
- Display a warning message if the user has over spent their budget for the month using the current month/year (accessing real table data rather than hard coded budget)

### Future functionality:
- Improve the styling
- Update the transactions screen to provide a current month summary by tag of actual spend, budget and remaining amount (this info currently can be viewed via the tag budget screen)
- Provide a chart or graph screen which provides a comparison of monthly spending with colour coding of red/amber/green to show where the user has overspent their monthly budget
- Provide filters/searches to restrict the list of transactions by date/vendor/tag
