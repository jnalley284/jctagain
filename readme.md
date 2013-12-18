# Just Call Tony
Managing contractors for your commercial building
repairs suck. Let Tony show you how he can help

## Working
Registration works - On close you of the modal it needs to be directed to the users dashboard

## Todo
- contact us implementation
- move stripe serverside to delayed job

Admin
The admin panel needs to be embedded into flex so I do not want to have a username and password login
instead pass a secure key to the url.

From the admin panel they should be able to view all jobs and **post updates**. These need to be sent via email
They should also be able to click a button to charge the card.
Eventually this information will be fed back into flex but not at the moment.






# After creating a project
- Get the Flex user_id and save it to the user
- Create a project on flex
- Update Account Details including project address
- Update the flex user with our data

1. RegistrationService.create(user)
2. AccountService.update_account(project)
3. ProjectService.create(project)