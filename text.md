# HCM4all 2.0


## Requirements

To run the application, you'll need:

* Ruby 2.3.0
* PostgreSQL 9.0+
* Redis 3
* PostgreSQL headers (for bundle (pg gem))
* ImageMagick (for file upload (paperclip))
* elasticsearch

Recommended packages on Debian-based systems:

* postgresql
* redis-server
* libpq-dev
* imagemagick
* [elasticsearch](http://www.elasticsearch.org/download)

Step-by-step dependencies installation on Ubuntu:

* Installing proper Ruby version(all commands should run from terminal):

The first step is to install some dependencies for Ruby.

	sudo apt-get update
	sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs

Install Ruby using rbenv(Recommended):

	cd
	git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc
	exec $SHELL

	git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
	exec $SHELL

	rbenv install 2.4.2
	rbenv global 2.4.2
	ruby -v
	# ruby 2.4.2
	gem install bundler

Install Rails:
	
	curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
	sudo apt-get install -y nodejs
	gem install rails -v 5.1.4
	rbenv rehash
	rails -v
	# Rails 5.1.4

Setting Up PostgreSQL:	
	
	sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
	wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install postgresql-common
	sudo apt-get install postgresql-9.6 libpq-dev

Create folder for "hcm4all" project (for example mkdir Projects) then cd Projects and clone with Git:
	
	git clone https://github.com/hcm4all

## Bootstrapping

Setup environment-specific database users with createdb privilege:

	sudo -u postgres psql -c "create user hcm4all_dev password 'xinuge80' createdb"

Create database.yml file in /config with commands:

	cd config && touch database.yml && cp database.example.yml database.yml		

Generate environment variables (see below):

	rake hcm4all:variables

It will generate a default config/application.yml Put your postgres PG_USER and PG_PASSWORD fields as key-value. For example:
	
	PG_USER: hcm4all_dev
	PG_PASSWORD: xinuge80

Visit [http://local.hcm4all.de/](http://local.hcm4all.de/).

Install bundle and create and migrate database as usual:

	bundle
	rake db:create
	rake db:migrate

## Configuration

We use [figaro](https://github.com/laserlemon/figaro) to handle more or less secret variables like SMTP credentials or the secret token for cookie signing. You can generate a default config/application.yml with:

	rake hcm4all:variables

## Documentation

To generate a PDF snapshot of the domain model install Graphviz (>= 2.22) and run

	bundle exec erd

## Contributing

It is a good idea to run the code audit before commits. You can add the following to your `.git/hooks/pre-commit`:

	bundle exec rails-audit

To always push the current HEAD to gerrit's refs/for/master run:

	git config remote.origin.push 'HEAD:refs/for/master'

To automatically add and notify some reviewers in gerrit run:

	git config remote.origin.receivepack 'git receive-pack --reviewer name1 --reviewer name2'

To automagically add a change ID to your commits, you can grab the commit-msg hook from gerrit:

    scp -p -P 60022 <username>@dev.hcm4all.de:hooks/commit-msg .git/hooks/commit-msg

### A note on bundler / license-finder

If LicenseFinder's database (`doc/dependencies.db`) changes without changing `Gemfile.lock`, probably your bundler
version differs from the one used when creating the dependency file.

Find out the version used for creating the current `dependencies.db`:

	sqlite3 doc/dependencies.db "select version from dependencies where name = 'bundler'"

Find out your current version:

	bundle -v

If your version is lower you can install the newer one:

	gem install bundler -v `sqlite3 doc/dependencies.db "select version from dependencies where name = 'bundler'"`

If your version is higher just commit the new `doc/dependencies.db` and let the others upgrade their bundler versions.

## Deploying

For production setup instructions see `doc/nginx.conf` and `doc/setup.md`. Deployment is done using capistrano (`cap deploy && cap deploy:migrate`).

## Testing Code
	console: rubocop -h
	console: rubocop -c .rubocop.yml
	rails-audit
	
## This is for test branch

