module ApplicationHelper
  def is_current_path?(path)
    path == request.fullpath ? 'current' : nil
  end
end
