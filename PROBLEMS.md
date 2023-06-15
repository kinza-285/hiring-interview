### Please describe found weak places below.

#### Security issues

1. We have to use strong params in transactions#create
2. ...
3. ...
#### Performance issues

1. We need pagination in transactions#index
2. Add search and filters to transaction index page
3. Add autifill for manager on app/views/transactions/new_extra.html.erb 
#### Code issues

1. We do not need methods new_large and new_extra_large in TransactionsController
2. Line @manager = Manager.all.sample has to be chanched to @manager = Manager.all.sample if params[:type] == 'extra' in new method of TransactionsController
3. Line @manager = Manager.all.sample if params[:type] == 'extra' has to be chanched to @manager = Manager.find_by(id: manager_id) if params[:type] == 'extra' in create method of TransactionsController
4. Line render "new_#{params[:type]}" has to be chanched to redirect_to new_transaction_path type: params[:type] in create method of TransactionsController
5. Add link to show action on index page
6. Select Manager on new_extra page
7. Add client model and move first_name and last_name to this model frpom transactions
8. Move logic from create action of TransactionsController and from Transaction model to CreateTransactionService
9. Divide CreateTransactionService into 3 parts CreateSmallTransactionService, CreateLargeTransactionService, CreateExtraTransactionService
#### Others

1. There are no tests
2. ...
3. ...
