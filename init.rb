require 'redmine'
require_dependency 'markdown_in_repository/render'
require_dependency 'markdown_in_repository/repositories_controller_patch'

Rails.configuration.to_prepare do
  unless RepositoriesController.included_modules.include? MarkdownInRepository::RepositoriesControllerPatch
    RepositoriesController.send(:include, MarkdownInRepository::RepositoriesControllerPatch)
  end
end

Redmine::Plugin.register :redmine_render_markdown_in_repository do
  name 'Render Markdown in Repository'
  author 'Makoto Kawasaki'
  author_url 'https://makotokw.com'
  description 'This plugin renders markdown file in repository'
  version '1.1.0'
  url 'https://github.com/makotokw/redmine_render_markdown_in_repository'
  requires_redmine :version_or_higher => '2.0'
end
