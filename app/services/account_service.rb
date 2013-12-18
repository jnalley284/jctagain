require 'savon'

# Update Account Details
# Update the flex user with our data

class AccountService
  def initialize
    # @client = Savon.client(wsdl: 'http://intranet.aanthonycorp.com/beta/Account_info.asmx?WSDL')
  end

  def update_account(project)
    @project = project
    response = Typhoeus.get('https://intranet.aanthonycorp.com/beta/JCT_ACCT_Update.aspx?', params: message_params(@project), ssl_verifypeer: false)
    response.success?
    # Temporary disable this
    # response = @client.call(:addaccount_info, message: message_params(@project))
    # response.body[:addaccount_info_response][:addaccount_info_result] == 'Account Information stored successfully'
  end

  def message_params(project)
    user = project.user
    address = project.address
    user_id = user.flex_id ? user.flex_id : 0
    message = {
      username: 'jct',
      password: 'j!ct2#',
      account_ID: user_id,
      account_name: user.flex_account_name,
      first_name: user.first_name,
      last_name: user.last_name,
      primary_phone: address.phone_number,
      address: address.full_address,
      city:address.city,
      state:address.state,
      zipcode:address.zipcode
    }
  end
end
