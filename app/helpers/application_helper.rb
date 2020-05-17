module ApplicationHelper
  def foundation_flash(key)
    case key
    when 'alert'; 'alert'
    when 'notice'; 'success'
    end
  end
end
