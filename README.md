# Jackson: The Movie

Jackson: The Movie

To start production Docker container: `make run-prod`

## Run the application locally

Run `make up` to start up the container from the docker compose manifest.\
Subsequently open [http://localhost:3000](http://localhost:3000) to access the locally running version of the app in your browser.

💡 If you wish to change the port 3000 to something else run `make docker-compose.override.yml` and add it in docker-compose.override.yml

### Authentication
Even the local version of the app requires authentication via Auth0. Login with staging credentials to access the app locally.

## Automatic lint checks
This project has automatic linting checks in the CI pipeline.

|☣️ **DO NOT PUSH UNFORMATTED CODE** |

## Format the code
You can manually format the code with `make format`.\
You can manually check if the code is properly formatted with `make lint-check`.

### Setup linter extension
Install [this](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) or any other extension and make sure that it has formatting priority on save.
To make sure of this, add the following to the settings.json file of your vscode configuration:
```json
{
  // ...
  "eslint.format.enable": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
```
The ESLint extension should pick up local configurations (`.eslintrc.json`) from the root of the project.

## Makefile commands
As you might already noticed we make use of the GNU make tool which controls generation of executables. Make knows most of the things needed
to build LeadFlow. When there is something to run, execute, build - we add it to a MakeFile as a recipe such that the most you should do is to
run some self-descriptive make command. Check out this  - `make help`. It lists all the available commands with a brief explanation.

`make install`
Set up development environment with one console command and have an up and running application on your local machine.

`make up`
Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

`make test`

Runs test.
If you wish to run tests in the interactive watch mode use `make test-interactive`\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

`make run-prod`

Builds the app in production environment and runs it in container. You can check it out in [your browser](http://localhost:7327).
It correctly bundles React in production mode and optimizes the build for the best performance.
The build is minified and the filenames include the hashes.\
The resulting app is exactly the same as it would be in production. I would need it if you on a final stages of development
and want to make sure the app is stable in production environment as well.

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

## Learn More About React

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).