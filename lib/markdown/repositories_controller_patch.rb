require_dependency 'repositories_controller'

module MarkdownRepositoriesControllerPatch
  MARKDOWN_EXTS = %w{md markdown}.freeze
  MARKDOWN_EXTS.each do |ext|
    Redmine::MimeType::EXTENSIONS[ext] = 'text/x-markdown'
  end

  def self.included(base)
    base.send(:include, InstanceMethod)
    base.class_eval do
      unloadable
      alias_method_chain :entry, :markdown
    end
  end

  module InstanceMethod
    def entry_with_markdown
      entry_without_markdown
      if !performed? && @path =~ /\.(?:#{MARKDOWN_EXTS.join('|')})$/i
        markdown = Redcarpet::Markdown.new(
            MarkdownRender,
            :autolink => true,
            :fenced_code_blocks => true,
            :space_after_headers => true,
            :tables => true,
            :strikethrough => true,
            :superscript => true,
            :no_intra_emphasis => true
        )
        @content = markdown.render(@content)
        @content2 = 'hoge'
        render :action => 'entry_markdown'
      end
    end
  end
end



