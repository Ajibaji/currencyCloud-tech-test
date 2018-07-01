require 'rest_client'

class Recipients
    
    def self.listRecipients
        headers = {
        :content_type => 'application/json',
        :authorization => 'Bearer ' + Authenticate.freshToken
        }
        
        RestClient.get self.endPoint, headers
    end

    def self.endPoint
        'https://coolpay.herokuapp.com/api/recipients'
    end
end

