require 'rest_client'
require 'json'


class Authenticate

    def self.freshToken
        tokenHash = JSON.parse(self.postRequest) 
        tokenHash.fetch("token")
    end 

    def self.endPoint
        'https://coolpay.herokuapp.com/api/login'
    end

    private

    def self.postRequest
        values = '{
            "username": "AmmarA",
            "apikey": "0581938E7737A65B"
            }'
        headers = {
            :content_type => 'application/json'
            }
        
        RestClient.post self.endPoint, values, headers  
    end
    
end