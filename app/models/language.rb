class Language < ActiveRecord::Base
  def css_class_name
    case name
    when 'spanish'
      'important'
    when 'german'
      'warning'
    else
      'info'
    end
  end
end
