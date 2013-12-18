require 'savon'

class RegistrationService
  def initialize
    @client = Savon.client(wsdl: 'http://intranet.aanthonycorp.com/beta/Register.asmx?WSDL')
  end

  def create(user)
    message = {
      username: 'jct',
      password: 'j!ct2#',
      user_email_id: user.email
    }

    message = {
      username: 'jct',
      password: 'j!ct2#',
      account_id: 17684,
      description: 'leaky tap',
      startdate: '10/15/2013'
    }
    response = @client.call(:registration,message: message)
    if response.body[:registration_response]
      user_id = response.body[:registration_response][:registration_result].to_i
      puts "user #{user_id}"
      user.flex_id = user_id
      user.save!
    end
    user
  end
end
