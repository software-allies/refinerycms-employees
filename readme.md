# Employees extension for Refinery CMS.

## How to build this extension as a gem

    cd vendor/extensions/employees
    gem build refinerycms-employees.gemspec
    gem install refinerycms-employees.gem

## How to install this extension in refinery

add the next line to the Gemfile
	gem 'refinerycms-employees', git: "https://github.com/software-allies/refinerycms-employees.git"#:path => 'vendor/extensions'
and run the next lines in console
	rails generate refinery:employees
	rake db:migrate
	rake db:seed
	rails s