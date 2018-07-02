require 'rest_client'
require 'json'
require 'envyable'

Envyable.load('config/env.yml')

class Authenticate 

    def self.endPoint
        'https://coolpay.herokuapp.com/api/login'
    end

    private

    def self.postRequest
        values = '{
            "username": "' + ENV['API_USERNAME'] + '",
            "apikey": "' + ENV['API_KEY'] + '"
            }'

        headers = {
            :content_type => 'application/json'
            }
        p Authenticate.endPoint 
        p values
        p headers
        RestClient.post Authenticate.endPoint, values, headers  
    end

    def self.freshToken
        tokenHash = JSON.parse(Authenticate.postRequest) 
        tokenHash.fetch("token")
    end
    
end
