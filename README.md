# crimson-golem

## Setup:
1. Downloand and move Chromedriver and Geckodriver to you `/bin` directory
2. Install RVM:
	- Used to manage Ruby versions.
	- Following install instructions on:
		- https://github.com/rvm/ubuntu_rvm
3. Install Ruby:
	- `rvm install ruby-2.7.0`
	- `rvm --default use ruby-2.7.0`
	- The 2.7.0 version of Ruby should now be install and set as the default version of Ruby for your Linux machine to confirm this type:
		- `which ruby`
	- Output should be something like the following:
		- `/usr/share/rvm/rubies/ruby-2.7.0/bin/ruby`
4. Install Bundler:
	- Used to manage dependencies in a gemfile.
		- `gem install bundler`
	- https://bundler.io/
5. Open a terminal and cd into the ruby-pom-cucumber-selenium directory.
6. execute `bundler install`

## Executing a test:
1. Via Command Line:
	- Since Cucumber is out test executor you can call the cucumber command from within the repo to execute all tests.
		- `BROWSER='chrome' cucumber`
	- To run a specific feature file:
		- `'BROWSER='chrome' cucumber /path/to/feature/file`

## RSPEC-Expectations
For help on rspec expectations and the usage of expects see below:
 - https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
