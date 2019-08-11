require 'redcarpet'
require 'coderay' if Redmine::VERSION::MAJOR < 4
require 'rouge' if Redmine::VERSION::MAJOR >= 4

module MarkdownInRepository
  MARKDOWN_EXTS = %w{md markdown}.freeze
  MARKDOWN_EXTS.each do |ext|
    Redmine::MimeType::EXTENSIONS[ext] = 'text/x-markdown'
  end

  class MarkdownRender < Redcarpet::Render::HTML
    def block_code(code, language)
      # convert utf8
      code = Redmine::CodesetUtil.to_utf8_by_setting(code)
      if Redmine::VERSION::MAJOR < 4
        language = CodeRay::FileType[language] if language
        language ||= :auto
        CodeRay.scan(code, language).div
      else
        lexer = ::Rouge::Lexer.find(language.to_s.downcase) || ::Rouge::Lexers::Shell
        formatter = ::Rouge::Formatters::HTMLPygments.new(::Rouge::Formatters::HTML.new, 'syntaxhl')
        ::Rouge.highlight(code, lexer, formatter)
      end
    end
  end
end