class ProjectService
  
  def initialize
    @client = Savon.client(wsdl: 'http://intranet.aanthonycorp.com/beta/Project_Creation.asmx?WSDL') do
      convert_request_keys_to :none
    end
  end

  def create(project)
    response = @client.call(:add_projects, message: message_params(project))
    project_info = format_create_body(response)
    
    project.update_attribute(:flex_project_id, project_info[:project_id])
    account_id = project_info[:account_id] ? project_info[:account_id] : 0
    project.user.update_attribute(:flex_id,project_info[:account_id].to_i)
  end  

  def project_details(project)
    client = Savon.client(wsdl: 'http://intranet.aanthonycorp.com/beta/Project_Details.asmx?WSDL') do
      convert_request_keys_to :none
    end
    message = {
      username: 'jct',
      password: 'j!ct2#',
      Pcode: project.flex_project_id
    }
    response = client.call(:projects_detail, message: message)
    results = response.body[:projects_detail_response][:projects_detail_result][:diffgram][:new_data_set][:table]
  end

  def message_params(project)
    user = project.user
    account_id = user.flex_id ? user.flex_id : 0
    message = {
      username: 'jct',
      password: 'j!ct2#',
      account_ID: account_id,
      description: project.name,
      startdate: project.start_date,
      User_email_id: user.email
    }
    return message
  end

  def format_create_body(response)
    response.body[:add_projects_response][:add_projects_result][:diffgram][:new_data_set][:projectinfo]
  end
end
