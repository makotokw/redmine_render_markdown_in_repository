# Redmine Render Markdown in Repository

This plugin renders markdown file(``.md`` or ``.markdown``) in repository.

## Requirements

* Redmine 2.5 - 4.x
* [codelay](https://github.com/rubychan/coderay) (for syntax highlighting)
 
## Installation

### Install codelay

1. Create ``Gemfile.local`` into ``#{RAILS_ROOT}``.
 ```
# plugins/redmine_render_markdown_in_repositor
gem 'coderay', '~> 1.1'
```
2. Execute ```bundle install``` command.

### Install plugin

1. Copy this plugin into ``#{RAILS_ROOT}/plugins`` from GitHub.
    - https://github.com/makotokw/redmine_render_markdown_in_repository/releases
2. Restart Redmine after installing the plugin.
