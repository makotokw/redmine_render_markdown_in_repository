require_dependency 'repositories_controller'

module MarkdownInRepository

  module RepositoriesControllerPatch

    def self.included(base)
      base.send(:include, InstanceMethod)
      base.class_eval do
        unloadable
        # TODO: use module#prepend
        alias entry_without_markdown entry
        alias entry entry_with_markdown
      end
    end

    module InstanceMethod
      def entry_with_markdown
        entry_without_markdown
        if !performed? && @path =~ /\.(?:#{MARKDOWN_EXTS.join('|')})$/i
          markdown = Redcarpet::Markdown.new(
              MarkdownInRepository::MarkdownRender,
              :autolink => true,
              :fenced_code_blocks => true,
              :space_after_headers => true,
              :tables => true,
              :strikethrough => true,
              :superscript => true,
              :no_intra_emphasis => true
          )
          @content = markdown.render(@content)
          render :action => 'entry_markdown'
        end
      end
    end
  end
end


