# Redmine Render Markdown in Repository

This plugin renders markdown file in repository.

## Requirements

* Redmine 2.0 or later
* redcarpet


## Installation

### Install redcarpet

Create ``Gemfile.local`` into ``#{RAILS_ROOT}``.

```
gem 'redcarpet', '2.2.2'
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