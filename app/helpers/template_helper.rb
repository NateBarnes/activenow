module TemplateHelper
  def template
    @template ||= ActionView::Base.new
  end
end
