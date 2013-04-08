require 'redcarpet'
require 'coderay'

class MarkdownRender < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div
  end
end