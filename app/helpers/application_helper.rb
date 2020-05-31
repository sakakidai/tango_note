module ApplicationHelper
  def foundation_flash(key)
    case key
    when 'alert'; 'alert'
    when 'notice'; 'success'
    end
  end

  def javascript_path
    "#{controller_path}.js"
  end
end
