class Language < ActiveRecord::Base
  default_scope -> { order('name ASC') }

  def css_class_name
    case name
    when 'spanish'
      'important'
    when 'german'
      'warning'
    when 'french'
      ''
    else
      'info'
    end
  end

  def friendly_name
    name.capitalize
  end
end
