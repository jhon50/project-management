# Project Manager
This is a simple project management application created to demonstrate usage of Rails 7 with Stimulus.
You should be able to add comments to a project discussion and edit comments.

Also you can change the status of the project and a log entry will be added as a comment to record who made the change.
## Getting Started

Follow these steps to get the project setup on your machine.

### 1. Clone the repository

```bash
git clone https://github.com/jhon50/project-management.git
```

### 2. Install Ruby (using RVM)

```bash
rvm install 3.1.4
```

### 3. Run setup

```bash
bundle exec rake db:setup
bundle exec rake db:migrate
bundle exec rake db:test:prepare
bundle exec rake db:seed (This will create default Project records)
```

### 3. Run rails server

```bash
bundle exec rails server
```

Project should be available at http://localhost:3000

Tutorial:
 - To edit a comment click on it
 - To change the status of a project click on the status dropdown and simply select another status

Known issues (leaving as is due to time constraints):
- When you change project status the log entry is not displayed in the UI until you refresh the page.
- When adding a new comment it doesn't show the user email until you refresh the page.
