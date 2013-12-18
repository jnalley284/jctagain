module ProjectsHelper
  def link_active(project_status = nil, link = '')
    return 'active' if project_status.nil? && link == 'all'
    return 'active' if project_status == 'false' && link == 'active'
    return 'active' if project_status == 'true' && link == 'closed'
  end
end