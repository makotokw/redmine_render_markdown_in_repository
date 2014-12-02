require 'redcarpet'
require 'coderay'

module MarkdownInRepository

  MARKDOWN_EXTS = %w{md markdown}.freeze
  MARKDOWN_EXTS.each do |ext|
    Redmine::MimeType::EXTENSIONS[ext] = 'text/x-markdown'
  end

  class MarkdownRender < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= :plaintext
      CodeRay.scan(code, language).div
    end
  end
end