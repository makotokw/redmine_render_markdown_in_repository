# Redmine Render Markdown in Repository

This plugin renders markdown file(.md or .markdown) in repository.

## Requirements

* Redmine 2.0 or later
* redcarpet (Redmine 2.4 or earlier)

## Installation

### Install redcarpet (Redmine 2.4 or earlier)

Redmine 2.5.0 includes redcarpet already. You should install redcarpet by using ``Gemfile.local`` if Redmine 2.4 or earlier

Create ``Gemfile.local`` into ``#{RAILS_ROOT}``.

```
gem 'redcarpet', '~> 2.3.0'
```

And execute ```bundle install``` command.

```
cd /path/to/redmine/
bundle install
```

### Install pluign


Copy plugin into ``#{RAILS_ROOT}/plugins`` from GitHub.

```
cd /path/to/redmine/plugins
git clone git://github.com/makotokw/redmine_render_markdown_in_repository.git
```

Restart Redmine after installing plugin.
