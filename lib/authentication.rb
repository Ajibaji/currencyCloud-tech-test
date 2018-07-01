require 'rest_client'
require 'json'
require 'envyable'

Envyable.load('config/env.yml')

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
            "username": ' + ENV["API_USERNAME"] + ',
            "apikey": ' + ENV["API_KEY"] + '
            }'
        headers = {
            :content_type => 'application/json'
            }
        
        RestClient.post self.endPoint, values, headers  
    end
    
end