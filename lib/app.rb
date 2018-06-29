require 'rest_client'

    def authenticate
        
        values = '{
            "username": "AmmarA",
            "apikey": "0581938E7737A65B"
            }'
        
        headers = {
            :content_type => 'application/json'
            }
        
        response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers
        
        response 
    end

    def freshToken
        tokenHash = JSON.parse(authenticate) 
        tokenHash.fetch("token") 
    end 


