# Twitter-Like Application

A Ruby on Rails web application that replicates basic functionality of Twitter.

[![Heroku deployment](<app/assets/images/screenshots/Screenshot 2023-06-22 at 6.48.24 PM.png>)](https://polar-reaches-06672-87ea166b6282.herokuapp.com)

## Languages and Tools Used

- Ruby (version 3.1.2)
- HTML
- JavaScript
- Rails (version 7.0.4)
- AWS SDK S3
- Sprockets Rails
- Puma (version 5.0)
- jsbundling-rails
- Turbo Rails
- Stimulus Rails
- cssbundling-rails
- Jbuilder
- Bootstrap Form (version 5.0)
- bcrypt (version 3.1.7)
- tzinfo-data
- bootsnap
- omniauth-github
- omniauth-rails_csrf_protection
- debug
- web-console
- guard
- guard-minitest

## Setup

### Prerequisites

Ensure you have Ruby (version 3.1.2) installed on your system. See [official installation guide](https://www.ruby-lang.org/en/documentation/installation/) for instructions.

### Install Dependencies

After cloning the repo, navigate into the project directory and install the necessary dependencies:

\`\`\`
bundle install
\`\`\`

### Database Creation

This application uses PostgreSQL for its database. Ensure PostgreSQL is installed on your system and running. To create the database, run:

\`\`\`
rails db:create
\`\`\`

### Database Initialization

To run the database migrations, execute:

\`\`\`
rails db:migrate
\`\`\`

## Running the Application

To start the application locally, run:

\`\`\`
rails server
\`\`\`

Then, visit http://localhost:3000 in your browser.

## Testing

Testing is done using Minitest.

## Deployment

The application is ready to be deployed on Heroku. Note that you will need to set up the following environment variables for OmniAuth:

- `GITHUB_KEY`: Your GitHub OAuth application's Client ID
- `GITHUB_SECRET`: Your GitHub OAuth application's Client Secret

These should be set in the settings of your Heroku application.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
